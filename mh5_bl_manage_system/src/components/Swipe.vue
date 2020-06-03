<template>
  <div class="swipe">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>首页管理</el-breadcrumb-item>
      <el-breadcrumb-item>轮播图</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <el-button type="primary" plain @click="add_eachs('0')">添加轮播图</el-button>
      <br />
      <br />
      <!-- 表格 -->
      <el-table :data="imageData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="image" label="图片">
          <template slot-scope="scoped">
            <img :src="scoped.row.image" width="300px" alt srcset />
          </template>
        </el-table-column>
        <el-table-column prop="link" label="链接跳转"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scoped">
            <el-button
              type="primary"
              icon="el-icon-edit"
              size="mini"
              @click="add_eachs('1',scoped.row)"
            >编辑</el-button>
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="delCat(scoped.row)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>

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

    <!--三级 弹出框 -->
    <el-dialog
      :title="add_each == 0 ? '添加轮播图' : '编辑轮播图'"
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
        <el-form-item label="图片链接" prop="link">
          <el-input v-model="threeForm.link"></el-input>
        </el-form-item>
        <el-form-item label="分类图片">
          <el-button size="small" type="warning" @click="toggleShow">点击上传</el-button>
          <my-upload
            @crop-upload-success="cropUploadSuccess"
            @crop-upload-fail="cropUploadFail"
            v-model="show"
            :width="710"
            :height="310"
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
      // 添加 编辑 状态
      add_each: 0, // 0 添加 1 编辑
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
        link: "",
        image: ""
      },
      // 验证  添加表单
      threeFormRules: {
        link: [{ required: true, message: "请输入图片链接", trigger: "blur" }]
      },
      //轮播图数据
      imageData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 2 // 每页显示多少条数据
      },
      // 总数
      total: 0
    };
  },
  created() {
    this.imageList();
  },
  components: {
    "my-upload": myUpload
  },
  methods: {
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
        "/main_ad_images/" + row.id
      );
      // console.log(res);
      // 错误时
      if (res.code !== 200) return this.$message.error(res.error);
      // 成功时
      this.$message.success(res.message);
      // console.log(this.catData);
      // 删除该页面最后一条数据时，会出现没有数据 这样不符合逻辑 让当前数据的长度 和 当前页面 必须不是第一个页面 层级不为一级时
      if (this.imageData.length === 1 && this.catInfo.pagenum > 1) {
        // 让 页数 减减
        --this.catInfo.pagenum;
      }
      // 渲染 分类目录数据
      this.imageList();
    },
    // 判断 几级分类
    add_eachs(part, row) {
      this.add_each = part;
      this.threeVisible = true;
      if (part == 1) {
        this.$http.get("main_ad_images/" + row.id).then(res => {
          // console.log(res);
          this.threeForm = res.data.data;
          // 上传时需要 图片路径
          this.imgDataUrl = res.data.data.image;
        });
      }
    },
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
      this.threeForm.image = jsonData.file;
    },
    //上传失败回调
    cropUploadFail(status, field) {
      // console.log("上传失败状态" + status);
      this.$message.error("上传失败，请重试");
    },
    // 添加轮播图
    threeAddCat() {
      this.$refs.threeForm.validate(async valid => {
        // 判断是否正确
        if (!valid) return;
        // 判断上传图片
        if (this.threeForm.sort_image === "") {
          return this.$message.error("图片必须选择!");
        }
        // 添加时
        if (this.add_each === "0") {
          // 正确的话 ，请求
          let { data: res } = await this.$http.post(
            "/main_ad_images",
            this.threeForm
          );
          // console.log(res);
          // 错误时
          if (res.code !== 200) return this.$message.error(res.error);
          // 成功时
          this.$message.success(res.message);
        } else {
          let { data: res } = await this.$http.put(
            "/main_ad_images",
            this.threeForm
          );
        }
        // 渲染 分类目录数据
        this.imageList();
        // 让弹出框消除
        this.threeVisible = false;
      });
    },
    // 弹出框 关闭时的回调
    threeAddCatClose() {
      // 表单清空
      this.$refs.threeForm.resetFields();
      this.imgDataUrl = "";
    },
    // 分页 当前页数量
    handleSizeChange(val) {
      // 修改 数量
      this.catInfo.pagesize = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.imageList();
    },
    //轮播图
    imageList() {
      this.$http.get("main_ad_images", { params: this.catInfo }).then(res => {
        // console.log(res);
        this.imageData = res.data.data;
        // 总数
        this.total = res.data.total;
        // console.log(this.imageList);
      });
    }
  }
};
</script>


<style lang="less">
.swipe {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
}
</style>