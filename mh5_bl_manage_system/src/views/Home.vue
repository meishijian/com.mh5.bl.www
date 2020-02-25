<template>
  <el-container class="home">
    <el-header>
      <el-button type="warning" @click="out()">退出</el-button>
    </el-header>
    <el-container>
      <el-aside width="200px">
        <el-menu
          default-active="1"
          class="el-menu-vertical-demo"
          :unique-opened="true"
          :router="true"
        >
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-mouse"></i>
              <span>商品管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/goodslist">商品列表</el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <template v-if="login === 'root'">
            <el-menu-item index="/class">
              <i class="el-icon-collection"></i>
              <span slot="title">分类</span>
            </el-menu-item>
            <el-menu-item index="/swipe">
              <i class="el-icon-magic-stick"></i>
              <span slot="title">首页轮播图</span>
            </el-menu-item>
            <el-menu-item index="/brand">
              <i class="el-icon-s-operation"></i>
              <span slot="title">商家店铺</span>
            </el-menu-item>
            <el-menu-item index="/users">
              <i class="el-icon-user-solid"></i>
              <span slot="title">用户信息</span>
            </el-menu-item>
          </template>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>


<script>
export default {
  data() {
    return {
      login: sessionStorage.getItem("login")
    };
  },
  methods: {
    // 退出
    out() {
      sessionStorage.clear();
      this.$router.push("/login");
    }
  }
};
</script>

<style lang="less">
.home {
  height: 100%;

  .el-menu-vertical-demo,
  .el-menu {
    background-color: transparent;
    border-style: none;
  }

  .el-container {
    height: 100%;
  }
  .el-header {
    padding: 10px;
    background-color: rgb(94, 79, 79);
  }
  .el-aside {
    background-color: rgb(252, 191, 214);
  }
  .el-main {
    background-color: rgb(90, 212, 206);
  }
}
</style>