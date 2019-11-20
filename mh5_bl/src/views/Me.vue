<template>
  <div class="me">
    <!-- 导航 -->
    <van-nav-bar title="个人中心" left-arrow @click-left="onClickLeft" />
    <!-- 大红色背景 -->
    <div class="pink">
      <img class="pink_img" src="https://mh5.bl.com/static/img/set.4cf7c7f.png" alt />
      <img class="pink_imgs" src="https://mh5.bl.com/static/img/shareLogo.png" alt />
      <span class="login">登录/</span>
      <span class="zhuce">注册</span>
    </div>
    <!-- 图片 -->
    <img class="tup" src="https://img23.iblimg.com/market-3/images/activity/285948628.jpg" alt />
    <!-- 收藏福利人人惠 -->
    <van-grid>
      <van-grid-item icon="photo-o" text="文字"></van-grid-item>
      <van-grid-item icon="photo-o" text="文字"></van-grid-item>
      <van-grid-item icon="photo-o" text="文字"></van-grid-item>
    </van-grid>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    //   返回箭头
    onClickLeft() {
      this.$router.push("/");
    }
  }
};
</script>
<style lang="less" >
.me {
  .pink {
    width: 375px;
    height: 130px;
    background-color: pink;
  }
  .pink_img {
    position: relative;
    top: 3px;
    left: 335px;
    display: block;
    width: 32px;
    height: 31px;
  }
  .pink_imgs {
    border-radius: 50%;
    width: 60px;
    height: 60px;
    margin-left: 14px;
    margin-top: 4px;
  }
  .login {
    display: block;
    color: #ffffff;
    margin-top: -47px;
    margin-left: 85px;
  }
  .zhuce {
    display: block;
    color: #ffffff;
    margin-top: -21px;
    margin-left: 124px;
  }
  .tup {
    width: 375px;
    height: 122;
  }
}
</style>