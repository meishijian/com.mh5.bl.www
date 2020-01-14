<template>
  <el-container class="home">
    <el-header>
      <el-button type="warning" @click="out()">退出</el-button>
    </el-header>
    <el-container>
      <el-aside width="200px">
        <el-menu default-active="1-1" class="el-menu-vertical-demo" :unique-opened="true">
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span>商品管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="1-1">商品列表</el-menu-item>
              <el-menu-item index="1-2">商品评论</el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <el-menu-item index="2">
            <i class="el-icon-setting"></i>
            <span slot="title">商家管理</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <el-main>Main</el-main>
    </el-container>
  </el-container>
</template>


<script>
export default {
  data() {
    return {
      mm: "21e"
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
    background-color: rgb(201, 219, 133);
  }
  .el-main {
    background-color: rgb(90, 212, 206);
  }
}
</style>