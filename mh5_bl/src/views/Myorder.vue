<template>
  <div class="shop">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="订单" @click-left="onClickLeft" class="left_shop">
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

    <!-- 内容 标签页 -->
    <van-tabs v-model="active">
      <van-tab title="全部">全部 1</van-tab>
      <van-tab title="待付款">待付款 2</van-tab>
      <van-tab title="待收货">待收货 3</van-tab>
      <van-tab title="待评价">待评价 4</van-tab>
    </van-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false,
      // 标签页
      active: 1
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
    width: 290px;
    margin-top: -18px;
    height: 269px;
    position: relative;
    top: 93px;
    left: 29px;
  }
  .van-tabs--line .van-tabs__wrap {
    height: 44px;
  }
}
</style>

