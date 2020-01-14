<template>
  <div class="login">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>登录</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="regist">未注册，请注册</el-button>
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
            <el-input v-model="loginForm.password"  show-password></el-input>
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
export default {
  data() {
    return {
      // 表单数据
      loginForm: {
        mobile: "17553041262",
        password: "123123"
      },
      // 表单数据 验证
      loginFormRules: {
        mobile: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }]
      }
    };
  },
  methods: {
    submitForm() {
      this.$refs.loginFormRef.validate(valid => {
        if (!valid) return this.$message.error("错了哦，输入用户名或密码");
        // 请求
        this.$http.post("/back/login", this.loginForm).then(res => {
          // console.log(res);

          if (res.data.code == 400) {
            return this.$message.error(res.data.error);
          }
          sessionStorage.setItem("token", res.data.token);
          this.$message.success("登录成功");
          this.$router.push("/");
        });
      });
    },
    resetForm() {
      this.$refs.loginFormRef.resetFields();
    },
    regist() {
      this.$router.push("/regist");
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
  }
  .box-card {
    width: 540px;
    height: 400px;
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