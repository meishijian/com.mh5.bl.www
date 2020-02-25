<template>
  <div class="brand">
    <!-- 面包屑 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>商家店铺</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片 -->
    <el-card class="box-card">
      <!-- 表格 -->
      <el-table :data="brandData" border style="width: 100%">
        <el-table-column type="index" width="50"></el-table-column>
        <el-table-column prop="bra_name" label="店铺名称"></el-table-column>
        <el-table-column prop="bra_image" label="店铺图标">
          <template slot-scope="scoped">
            <img :src="scoped.row.bra_image" width="80px" alt srcset />
          </template>
        </el-table-column>
        <!-- <el-table-column prop="bra_region" label="店铺地区"></el-table-column>
        <el-table-column prop="bra_introduce" label="店铺介绍"></el-table-column>-->
        <el-table-column prop="regtime" label="店铺创建时间">
          <template slot-scope="scoped">{{scoped.row.regtime | dateFormat}}</template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scoped">
            <el-button
              type="primary"
              icon="el-icon-edit"
              size="mini"
              @click="add_eachs(scoped.row)"
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
    <el-dialog title="编辑店铺" :visible.sync="threeVisible" width="35%" @close="threeAddCatClose">
      <!-- 表单 -->
      <el-form
        :model="threeForm"
        :rules="threeFormRules"
        ref="threeForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="店铺名称" prop="bra_name">
          <el-input v-model="threeForm.bra_name"></el-input>
        </el-form-item>
        <el-form-item label="店铺名称">
          <el-button size="small" type="warning" @click="toggleShow">点击上传</el-button>
          <my-upload
            @crop-upload-success="cropUploadSuccess"
            @crop-upload-fail="cropUploadFail"
            v-model="show"
            :width="80"
            :height="48"
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
        bra_name: "",
        bra_image: ""
      },
      // 验证  添加表单
      threeFormRules: {
        bra_name: [
          { required: true, message: "请输入图片链接", trigger: "blur" }
        ]
      },
      // 店铺数据
      brandData: [],
      catInfo: {
        pagenum: 1, // 当前页码值
        pagesize: 5 // 每页显示多少条数据
      },
      total: 0 // 总数
    };
  },
  created() {
    //   渲染 店铺数据
    this.getBrandData();
  },
  components: {
    "my-upload": myUpload
  },
  methods: {
    // 删除
    async delCat(row) {
      const confirmStr = await this.$confirm(
        "此操作将永久删除该店铺, 是否继续?",
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
        return this.$message("已取消删除该店铺");
      }
      const { data: res } = await this.$http.delete(
        "/goods_list_brand/" + row.id
      );
      // console.log(res);
      // 错误时
      if (res.code !== 200) return this.$message.error(res.error);
      // 成功时
      this.$message.success(res.message);
      // console.log(this.catData);
      // 删除该页面最后一条数据时，会出现没有数据 这样不符合逻辑 让当前数据的长度 和 当前页面 必须不是第一个页面 层级不为一级时
      if (this.brandData.length === 1 && this.catInfo.pagenum > 1) {
        // 让 页数 减减
        --this.catInfo.pagenum;
      }
      // 渲染 分类目录数据
      this.getBrandData();
    },
    // 修改 店铺
    threeAddCat() {
      this.$refs.threeForm.validate(async valid => {
        // 判断是否正确
        if (!valid) return;
        // 判断上传图片
        if (this.threeForm.bra_image === "") {
          return this.$message.error("店铺图标必须选择!");
        }
        // 添加时

        // 正确的话 ，请求
        let { data: res } = await this.$http.put(
          "/goods_list_brand",
          this.threeForm
        );
        // console.log(res);
        // 错误时
        if (res.code !== 200) return this.$message.error(res.error);
        // 成功时
        this.$message.success(res.message);
        // 渲染 分类目录数据
        this.getBrandData();
        // 让弹出框消除
        this.threeVisible = false;
      });
    },
    // 回显
    add_eachs(row) {
      this.threeVisible = true;
      this.$http.get("/goods_list_brand/" + row.id).then(res => {
        // console.log(res);
        this.threeForm = res.data.data;
        // 上传时需要 图片路径
        this.imgDataUrl = res.data.data.bra_image;
      });
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
      this.threeForm.bra_image = jsonData.file;
    },
    //上传失败回调
    cropUploadFail(status, field) {
      // console.log("上传失败状态" + status);
      this.$message.error("上传失败，请重试");
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
      this.getBrandData();
    },
    // 分页 每页
    handleCurrentChange(val) {
      // 修改 页数
      this.catInfo.pagenum = val;
      // 渲染 分类目录数据
      this.getBrandData();
    },
    //   渲染 店铺数据
    getBrandData() {
      this.$http
        .get("/goods_list_brand", { params: this.catInfo })
        .then(res => {
          //   console.log(res);
          this.brandData = res.data.data;
          // 总数
          this.total = res.data.total;
        });
    }
  }
};
</script>

<style lang="less">
.brand {
  .el-breadcrumb {
    margin-bottom: 15px;
  }
  .el-image__inner {
    width: 80px;
  }
}
</style>