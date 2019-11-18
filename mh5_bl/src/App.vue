<template>
  <div>
    <van-nav-bar class="van-nav-bar">
      <!-- 左边分类 -->
      <div slot="left" class="fenl">
        <van-icon class="fenimg" name="bars" color="#a8a8a8" size="18px"></van-icon>分类
      </div>
      <!-- 搜索框 -->
      <div slot="title">
        <van-search v-model="value" placeholder="搜索" shape="round" @search="onSearch"></van-search>
      </div>
      <!-- 右边 -->
      <div slot="right">
        <van-icon class="shopping" name="shopping-cart-o" color="#838383" size="25px" />
        <van-icon name="manager-o" color="#838383" size="25px" />
      </div>
    </van-nav-bar>

    <router-view />
  </div>
</template>

<script>
export default {
  data() {
    return {
      value: ""
    };
  },
  methods: {
    onSearch() {
      //  111
    }
  },
  created() {}
};
</script>

<style lang="less" >
.fenl {
  width: 67px;
  height: 33px;
  border-radius: 19px;
  background-color: #e5e5e5;
  line-height: 33px;
  color: #838383;
}
.fenimg {
  //  top: -px
  left: -3px;
}
.shopping {
  left: -10px;
}
</style>