<template>
  <div class="regist">
    <van-nav-bar left-arrow @click-left="onClickLeft" />
    <h1 class="h2">请注册您的账户</h1>
    <van-cell-group>
      <div>
        <p class="login_p_phone">
          <van-icon name="phone-o" class="phone-o" />手机号码
        </p>
        <van-field
          v-model="mobile"
          clearable
          label="+86"
          placeholder="请输入注册的手机号"
          class="mobile"
          :error-message="errorMobile"
        />
      </div>
      <div class="login_div_two">
        <p class="login_p_phone">
          <van-icon name="goods-collect-o" class="phone-o" />密码
        </p>
        <van-field
          v-model="password"
          type="password"
          label="密码"
          placeholder="请输入注册的密码"
          class="password"
          :error-message="errorPassword"
        />
      </div>
    </van-cell-group>
    <van-button type="default" class="default" @click="login">
      <van-icon name="arrow" class="arrow" />
    </van-button>

    <P class="login_p_thress" @click="login_regist">您已有账户，请前往登录界面</P>
  </div>
</template>
<script>
export default {
  data() {
    return {
      mobile: "",
      password: "",
      errorMobile: "",
      errorPassword: ""
    };
  },
  methods: {
    onClickLeft() {
      window.history.back(-1);
    },
    // 登录
    login() {
      if (this.mobile === "") {
        this.errorMobile = "手机号不能为空";
        return;
      }
      if (this.password === "") {
        this.errorMobile = "";
        this.errorPassword = "密码不能为空";
        return;
      }
      this.errorMobile = "";
      this.errorPassword = "";

      this.$http
        .post("/regist", {
          mobile: this.mobile,
          password: this.password
        })
        .then(res => {
          console.log(res);
          // 判断错误
          if (res.data.code !== 200) {
            if (res.data.error == "手机号已存在!") {
              this.errorMobile = "手机号已存在!";
            }
            if (res.data.error == "手机号码格式不正确!") {
              this.errorMobile = "手机号码格式不正确!";
            }
            if (res.data.error == "密码必须是6~18位的数字、字母、下划线!") {
              this.errorMobile = "";
              this.errorPassword = "密码必须是6~18位的数字、字母、下划线!";
            }
            if (res.data.error == "密码错误!") {
              this.errorMobile = "";
              this.errorPassword = "密码错误!";
            }
            // this.$dialog.alert({
            //   message: res.data.error
            // });
            return;
          }
          // 提示
          const toast = this.$toast.loading({
            duration: 0, // 持续展示 toast
            forbidClick: true,
            message: `${res.data.message} 3 秒`
          });
          let second = 3;
          const timer = setInterval(() => {
            second--;
            if (second) {
              toast.message = `${res.data.message} ${second} 秒`;
            } else {
              clearInterval(timer);
              // 手动清除 Toast
              this.$toast.clear();
              // 返回登录界面
              this.$router.push("/login");
            }
          }, 1000);
        });
    },
    // 注册页面
    login_regist() {
      this.$router.push("/login");
    }
  }
};
</script>


<style lang="less">
.regist {
  .h2 {
    margin-top: 10%;
    margin-left: 16%;
    font-weight: 100;
  }
  .van-nav-bar .van-icon {
    color: #383838;
    font-size: 20px;
    vertical-align: middle;
  }
  .van-cell-group {
    margin-top: 15%;
  }
  .mobile {
    font-size: 17px;
    padding-top: 0;
    .van-cell__title {
      width: 70px;
      text-align: center;
      margin-right: 20px;
    }
  }
  .password {
    font-size: 17px;
    .van-cell__title {
      width: 70px;
      text-align: center;
      margin-right: 20px;
    }
  }
  .login_p_phone {
    padding-left: 14px;
    color: #999999;
    .phone-o {
      margin-right: 7px;
    }
  }
  .login_div_two {
    margin-top: 20px;
  }
  .default {
    width: 58px;
    height: 58px;
    line-height: 73px;
    border-radius: 50%;
    background-color: #c6ccd1;
    position: relative;
    top: 50px;
    left: 80%;
    .arrow {
      font-size: 30px;
      color: #fff;
      margin-left: -2px;
    }
  }
  .login_p_thress {
    position: absolute;
    /* top: -13px; */
    left: 43%;
    display: inline-block;
    color: skyblue;
  }
}
</style>