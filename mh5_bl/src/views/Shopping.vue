<template>
  <div class="shop">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="购物车" @click-left="onClickLeft" class="left_shop">
      <!-- 右边 -->
      <div slot="right">
        <van-icon v-if="!icon" name="ellipsis" color="#666666" size="25px" @click="icon=!icon" />
        <van-icon v-else name="cross" color="#666666" size="25px" @click="icon=!icon" />
      </div>
    </van-nav-bar>
    <!-- 点击符号的两种状态 -->
    <div class="dahang">
      <!-- 他要根据 右边的图标变化而 变化 判断》。。 -->
      <van-tabbar :fixed="false" class="dahang_tabbar" v-if="icon==true">
        <van-tabbar-item icon="home-o" to="/">首页</van-tabbar-item>
        <van-tabbar-item icon="search" to="/search">搜索</van-tabbar-item>
        <van-tabbar-item icon="bars" to="/class">分类</van-tabbar-item>
        <van-tabbar-item icon="shopping-cart-o" to="/shopping">购物车</van-tabbar-item>
        <van-tabbar-item icon="contact" to="/me">我的i百联</van-tabbar-item>
      </van-tabbar>
    </div>
    <!-- <img class="dahang_img" src="../assets/img/001.jpg" alt /> -->
    <div class="wenzi">
      <p class="g_p">荔枝现在还没有心仪的宝贝(✿◡‿◡)</p>
      <p class="g_pp">主人快点给我挑点宝贝吧!</p>
      <p class="g_botton">去逛逛</p>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // console.log(111);
      window.history.back(-1);
    }
  },
  created() {}
};
</script>

<style lang="less">
.shop {
  .dahang_tabbar {
    background-color: pink;
    height: 60px;
    // color: red
  }
  .dahang_img {
    width: 100px;
    height: 100px;
  }
  .g_botton {
    width: 140px;
    height: 30px;
    color: aliceblue;
    background-color: pink;
    border-radius: 10px;
    text-align: center;
    line-height: 30px;
    // text-align: center;
  }
  .wenzi {
    width: 200px;
    height: 200px;
    border: 1px solid pink;
    margin: 154px auto;
  }
  .g_pp {
    font-size: 14px;
    text-align: center;
  }
  .g_p {
    font-size: 13px;
    text-align: center;
  }
}
</style>

