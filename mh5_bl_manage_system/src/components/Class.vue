<template>
  <div class="class">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>分类管理</el-breadcrumb-item>
      <el-breadcrumb-item>分类目录</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <el-button type="primary" plain @click="parts('0')">添加一级分类</el-button>
      <el-button type="primary" plain @click="parts('1')">添加二级分类</el-button>
      <el-button type="primary" plain @click="parts('2')">添加三级分类</el-button>
      <br />
      <br />
      <!-- 表格 -->
      <TreeTable
        :data="catData"
        :columns="treeColumns"
        show-index
        index-text="#"
        :selection-type="false"
        :expand-type="false"
        border
        stripe
      >
        <!-- 层级 -->
        <template slot="level" slot-scope="scoped">
          <img
            v-if="scoped.row.sort_image"
            :src="scoped.row.sort_image"
            width="100px"
            height="100px"
            alt
          />
          <p v-else>无</p>
        </template>
        <!-- 操作 -->
        <template slot="opt" slot-scope="scoped">
          <el-button type="primary" icon="el-icon-edit" size="mini" @click="eachCat(scoped.row)">编辑</el-button>
          <el-button type="danger" icon="el-icon-delete" size="mini" @click="delCat(scoped.row)">删除</el-button>
        </template>
      </TreeTable>

      <br />
      <!-- 分页 -->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="catInfo.pagenum"
        :page-sizes="[2, 5, 10, 15]"
        :page-size="catInfo.pagesize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>

    <!--一级 弹出框 -->
    <el-dialog
      :title="add_each === 0 ? '添加一级分类' : '编辑一级分类'"
      :visible.sync="oneVisible"
      width="35%"
      @close="oneAddCatClose"
    >
      <!-- 表单 -->
      <el-form
        :model="oneForm"
        :rules="oneFormRules"
        ref="oneForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="分类名称" prop="cla_name">
          <el-input v-model="oneForm.cla_name"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="oneVisible = false">取 消</el-button>
        <el-button type="primary" @click="oneAddCat">确 定</el-button>
      </span>
    </el-dialog>

    <!--二级 弹出框 -->
    <el-dialog
      :title="add_each === 0 ? '添加二级分类' : '编辑二级分类'"
      :visible.sync="twoVisible"
      width="35%"
      @close="twoAddCatClose"
    >
      <!-- 表单 -->
      <el-form
        :model="twoForm"
        :rules="twoFormRules"
        ref="twoForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="分类名称" prop="cat_title">
          <el-input v-model="twoForm.cat_title"></el-input>
        </el-form-item>
        <el-form-item label="分类选择">
          <el-select v-model="twovalue" placeholder="请选择">
            <el-option
              v-for="item in twooptions"
              :key="item.id"
              :label="item.cla_name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="twoVisible = false">取 消</el-button>
        <el-button type="primary" @click="twoAddCat">确 定</el-button>
      </span>
    </el-dialog>

    <!--三级 弹出框 -->
    <el-dialog
      :title="add_each === 0 ? '添加三级分类' : '编辑三级分类'"
      :visible.sync="threeVisible"
      width="35%"
      @close="threeAddCatClose"
    >
      <!-- 表单 -->
      <el-form
        :model="threeForm"
        :rules="threeFormRules"
        ref="threeForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="分类名称" prop="sort_name">
          <el-input v-model="threeForm.sort_name"></el-input>
        </el-form-item>
        <el-form-item label="分类选择">
          <el-cascader v-model="threevalue" :options="threeoptions" :props="threeprops"></el-cascader>
        </el-form-item>
        <el-form-item label="分类图片">
          <el-button size="small" type="warning" @click="toggleShow">点击上传</el-button>
          <my-upload
            @crop-upload-success="cropUploadSuccess"
            @crop-upload-fail="cropUploadFail"
            v-model="show"
            :width="100"
            :height="100"
            img-format="png"
            :size="size"
            langType="zh"
            :noRotate="false"
            :noSquare="true"
            :noCircle="true"
            field="file"
            :url="uploadURL"
            :headers="headersObj"
          ></my-upload>
          <br />
          <el-image :src="imgDataUrl">
            <div slot="error" class="image-slot"></div>
          </el-image>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="threeVisible = false">取 消</el-button>
        <el-button type="primary" @click="threeAddCat">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import "babel-polyfill"; // es6 shim
import myUpload from "vue-image-crop-upload";
import { add_Arti_upload, image } from "../config.js";
export default {
  data() {
    return {
      // 编辑提交 状态
      part: "0",
      // 添加 编辑 状态
      add_each: 0, // 0 添加 1 编辑
      // 三级 添加开始
      // 上传
      imgDataUrl: "",
      // 状态
      show: false,
      size: 2.1,
      // 图片上传路径
      uploadURL: add_Arti_upload,
      // 请求头
      headersObj: {
        Authorization: sessionStorage.getItem("token")
      },
      threeVisible: false,
      threeForm: {
        sort_name: "",
        sort_image: ""
      },
      // 验证  添加表单
      threeFormRules: {
        sort_name: [
          { required: true, message: "请输入分类名称", trigger: "blur" }
        ]
      },
      threevalue: [],
      threeoptions: [],
      threeprops: {
        label: "cla_name",
        value: "id"
      },
      // 三级 添加结束

      // 二级 添加开始
      twoVisible: false,
      twoForm: {
        cat_title: ""
      },
      // 验证  添加表单
      twoFormRules: {
        cat_title: [
          { required: true, message: "请输入分类名称", trigger: "blur" }
        ]
      },
      twovalue: "",
      twooptions: [],
      // 二级 添加结束

      // 一级 添加开始
      oneVisible: false,
      oneForm: {
        cla_name: ""
      },
      // 验证  添加表单
      oneFormRules: {
        cla_name: [
          { required: true, message: "请输入分类名称", trigger: "blur" }
        ]
      },
      // 一级 添加结束
      // 分类目录数据
      catData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 2 // 每页显示多少条数据
      },
      // 总数
      total: 0,
      // 定义表格中，都有哪些列
      treeColumns: [
        {
          label: "分类目录名称",
          prop: "cla_name"
        },
        {
          label: "三级分类图片",
          prop: "sort_image",
          // 先指定使用自定义模板渲染
          type: "template",
          // 模板名叫什么
          template: "level"
        },
        {
          label: "操作",
          // 先指定使用自定义模板渲染
          type: "template",
          // 模板名叫什么
          template: "opt"
        }
      ]
    };
  },
  // 生命周期
  created() {
    // 渲染 分类目录数据
    this.getCatData();
  },
  components: {
    "my-upload": myUpload
  },
  methods: {
    // 回显
    eachCat(row) {
      this.add_each = 1;
      // 请求
      this.$http
        .get("/goods_classify/" + row.id, { params: { part: row.part } })
        .then(res => {
          // console.log(res);
          // 判断
          if (res.data.code !== 200) {
            return;
          }
          if (row.part === "0") {
            this.oneVisible = true;
            this.part = "0";
            // 存放数据
            this.oneForm = res.data.data;
          } else if (row.part === "1") {
            this.twoVisible = true;
            this.part = "1";
            this.twoForm = res.data.data;
            this.twovalue = res.data.data.class_id;
            this.$http.get("/goods_left_side").then(res => {
              // console.log(res);
              // 判断
              if (res.data.code !== 200) {
                return;
              }
              // 成功
              this.twooptions = res.data.data;
            });
          } else if (row.part === "2") {
            this.threeVisible = true;
            this.part = "2";
            this.threeForm = res.data.data;
            this.imgDataUrl = res.data.data.sort_image;
            this.$http.get("/goods_one_two").then(res => {
              // console.log(res);
              // 判断
              if (res.data.code !== 200) {
                return;
              }
              // 成功
              this.threeoptions = res.data.data;
            });
          }
        });
    },
    // 删除
    async delCat(row) {
      const confirmStr = await this.$confirm(
        "此操作将永久删除该分类, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      ).catch(error => error);
      // console.log(confirmStr);
      // 判断 如果取消
      if (confirmStr === "cancel") {
        return this.$message("已取消删除该分类");
      }
      const { data: res } = await this.$http.delete(
        "/goods_classify/" + row.id,
        {
          params: {
            part: row.part
          }
        }
      );
      // console.log(res);
      // 错误时
      if (res.code !== 200) return this.$message.error(res.error);
      // 成功时
      this.$message.success(res.message);
      // console.log(this.catData);
      // 删除该页面最后一条数据时，会出现没有数据 这样不符合逻辑 让当前数据的长度 和 当前页面 必须不是第一个页面 层级不为一级时
      if (this.catData.length === 1 && this.catInfo.pagenum > 1) {
        // 让 页数 减减
        --this.catInfo.pagenum;
      }
      // 渲染 分类目录数据
      this.getCatData();
    },
    // 三级 添加开始
    // 修改 头像状态
    toggleShow() {
      this.show = !this.show;
    },
    //上传成功回调
    cropUploadSuccess(jsonData, field) {
      // console.log(jsonData);
      // 判断
      if (jsonData.code !== 200) {
        return this.$message.error("上传失败，请重试");
      }
      // 图片显示路径
      this.imgDataUrl = image + jsonData.file;
      // 上传时需要 图片路径
      this.threeForm.sort_image = jsonData.file;
    },
    //上传失败回调
    cropUploadFail(status, field) {
      // console.log("上传失败状态" + status);
      this.$message.error("上传失败，请重试");
    },
    // 添加三级分类
    threeAddCat() {
      this.$refs.threeForm.validate(async valid => {
        // 判断是否正确
        if (!valid) return;
        if (this.threevalue.length === 0)
          return this.$message.error("分类选择不能为空");
        // 判断上传图片
        if (this.threeForm.sort_image === "") {
          return this.$message.error("图片必须选择!");
        }

        // 添加时
        if (this.add_each === 0) {
          // 正确的话 ，请求
          this.threeForm.cat_id = this.threevalue[this.threevalue.length - 1];
          let { data: res } = await this.$http.post(
            "/goods_classify_three",
            this.threeForm
          );
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        } else {
          let { data: res } = await this.$http.put("/goods_classify", {
            part: this.part,
            id: this.threeForm.id,
            cla_name: this.threeForm.sort_name,
            sort_image: this.threeForm.sort_image,
            cat_id: this.threeForm.cat_id
          });
        }
        // 渲染 分类目录数据
        this.getCatData();
        // 让弹出框消除
        this.threeVisible = false;
      });
    },
    // 弹出框 关闭时的回调
    threeAddCatClose() {
      // 表单清空
      this.$refs.threeForm.resetFields();
      this.threevalue = [];
      this.imgDataUrl = "";
    },
    // 三级 添加结束

    // 二级 添加开始
    // 添加二级分类
    twoAddCat() {
      this.$refs.twoForm.validate(async valid => {
        // 判断是否正确
        if (!valid) return;
        if (this.twovalue === "")
          return this.$message.error("分类选择不能为空");
        // 添加时
        if (this.add_each === 0) {
          // 正确的话 ，请求
          this.twoForm.class_id = this.twovalue;
          let { data: res } = await this.$http.post(
            "/goods_classify_two",
            this.twoForm
          );
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        } else {
          // console.log(this.twoForm);
          let { data: res } = await this.$http.put("/goods_classify", {
            part: this.part,
            id: this.twoForm.id,
            cla_name: this.twoForm.cat_title,
            class_id: this.twoForm.class_id
          });
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        }

        // 渲染 分类目录数据
        this.getCatData();
        // 让弹出框消除
        this.twoVisible = false;
      });
    },
    // 弹出框 关闭时的回调
    twoAddCatClose() {
      // 表单清空
      this.$refs.twoForm.resetFields();
      this.twovalue = "";
    },
    // 二级 添加结束

    // 一级 添加开始
    // 判断 几级分类
    parts(part) {
      this.add_each = 0;
      if (part === "0") {
        this.oneVisible = true;
      } else if (part === "1") {
        this.twoVisible = true;
        this.$http.get("/goods_left_side").then(res => {
          // console.log(res);
          // 判断
          if (res.data.code !== 200) {
            return;
          }
          // 成功
          this.twooptions = res.data.data;
        });
      } else if (part === "2") {
        this.threeVisible = true;
        this.$http.get("/goods_one_two").then(res => {
          // console.log(res);
          // 判断
          if (res.data.code !== 200) {
            return;
          }
          // 成功
          this.threeoptions = res.data.data;
        });
      }
    },
    // 添加一级分类
    oneAddCat() {
      this.$refs.oneForm.validate(async valid => {
        // 判断是否正确
        if (!valid) return;
        // 添加时
        if (this.add_each === 0) {
          // 正确的话 ，请求
          let { data: res } = await this.$http.post(
            "/goods_classify_one",
            this.oneForm
          );
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        } else {
          this.oneForm.part = this.part;
          let { data: res } = await this.$http.put(
            "/goods_classify",
            this.oneForm
          );
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        }
        // 渲染 分类目录数据
        this.getCatData();
        // 让弹出框消除
        this.oneVisible = false;
      });
    },
    // 弹出框 关闭时的回调
    oneAddCatClose() {
      // 表单清空
      this.$refs.oneForm.resetFields();
    },
    // 一级 添加结束

    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.catInfo.pagesize = val;
      // 渲染 分类目录数据
      this.getCatData();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.getCatData();
    },
    // 分类目录数据
    getCatData() {
      this.$http.get("/goods_classify", { params: this.catInfo }).then(res => {
        // console.log(res);
        // 判断
        if (res.data.code !== 200) {
          return;
        }
        // 成功
        this.catData = res.data.data;
        // 总数
        this.total = res.data.total;
      });
    }
  }
};
</script>

<style lang="less">
.class {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>