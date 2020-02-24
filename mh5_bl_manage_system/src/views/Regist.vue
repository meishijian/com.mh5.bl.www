<template>
  <div class="login">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>注册</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="regist">已注册店铺，返回登录界面</el-button>
      </div>
      <div class="text item">
        <!-- 头标 -->
        <div class="login-pic">
          <img src="../assets/IMG_20180911_150647.jpg" />
        </div>
        <el-form
          :model="loginForm"
          :rules="loginFormRules"
          ref="loginFormRef"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="用户名" prop="mobile">
            <el-input v-model="loginForm.mobile"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input v-model="loginForm.password" show-password></el-input>
          </el-form-item>
          <el-form-item label="商家店铺名" prop="bra_name">
            <el-input v-model="loginForm.bra_name"></el-input>
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
          <el-form-item>
            <el-button type="primary" @click="submitForm">登录</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
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
      // 表单数据
      loginForm: {
        mobile: "",
        password: "",
        bra_name: "",
        bra_image: ""
      },
      // 表单数据 验证
      loginFormRules: {
        mobile: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        bra_name: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }]
      }
    };
  },
  components: {
    "my-upload": myUpload
  },
  methods: {
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
      this.loginForm.bra_image = jsonData.file;
    },
    //上传失败回调
    cropUploadFail(status, field) {
      // console.log("上传失败状态" + status);
      this.$message.error("上传失败，请重试");
    },
    submitForm() {
      this.$refs.loginFormRef.validate(valid => {
        if (!valid) return this.$message.error("错了哦，输入用户名或密码");

        // 店铺 图标
        if (this.loginForm.bra_image === "")
          return this.$message.error("店铺图片不能为空!");
        // 请求
        this.$http.post("/regist_brand", this.loginForm).then(res => {
          console.log(res);
          if (res.data.code == 400) {
            return this.$message.error(res.data.error);
          }
          this.$message.success("注册成功");
          this.$router.push("/login_brand");
        });
      });
    },
    resetForm() {
      this.$refs.loginFormRef.resetFields();
    },
    regist() {
      this.$router.push("/login");
    }
  }
};
</script>

<style lang="less">
.login {
  width: 100%;
  height: 100%;
  background-color: skyblue;
  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both;
  }

  .box-card {
    width: 480px;
    overflow: initial;
  }
  .box-card {
    width: 540px;
    height: 610px;
    background-color: #fff;
    position: absolute;
    left: 50%;
    top: 50%;
    border-radius: 4px;
    transform: translate(-50%, -50%);
  }
  //   图标
  .login-pic {
    width: 130px;
    height: 130px;
    background-color: #fff;
    border: 1px solid #eee;
    border-radius: 50%;
    padding: 10px;
    box-shadow: 0 0 10px #eee;
    position: absolute;
    left: 50%;
    top: 25%;
    transform: translatex(-50%) translateY(-50%);
    img {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      background: #eee;
    }
  }
  // 表单
  .el-form {
    position: absolute;
    bottom: 0px;
    width: 100%;
    left: -20px;
    padding: 20px;
    box-sizing: border-box;
  }
}
</style>