<template>
  <div class="address">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="地址列表" @click-left="onClickLeft" class="left_shop">
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
    <van-address-list v-model="chosenAddressId" :list="addressData" @add="onAdd" />
  </div>
</template>
<script>
export default {
  data() {
    return {
      icon: false,
      chosenAddressId: "",
      // 存放地址的数据
      addressData: []
    };
  },
  methods: {
    onClickLeft() {
      window.history.back(-1);
    },
    // 新添加地址按钮
    onAdd() {
      this.$router.push("/shopAddress");
    },

    // 获取所有的地址
    getAddress() {
      this.$http.get("/address_all").then(res => {
        // console.log(res);
        this.addressData = res.data.data;
        // console.log(this.addressData);
      });
    }
  },
  created() {
    this.getAddress();
  },
  watch: {
    chosenAddressId: function(va) {
      localStorage.setItem("address", va);
    }
  }
};
</script>

<style lang="less">
.address {
  .dahang_tabbar {
    background-color: pink;
    height: 60px;
    // color: red
  }
  .add {
    margin-left: 12px;
    width: 350px;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 29px;
  }

  //   #ff6f6f
}
</style>