<template>
  <el-container class="home">
    <el-header>
      <div class="logo-box">
        <img src="../assets/IMG_20180911_150647.jpg" alt />
        商城—后台管理系统
      </div>
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
          <template v-if="login === 'root'">
            <!-- 用户管理 -->
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-user-solid"></i>
                <span>用户管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/users">
                  <i class="el-icon-user"></i>
                  <span slot="title">用户信息</span>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <!-- 用户管理 -->
            <el-submenu index="2">
              <template slot="title">
                <i class="el-icon-document-copy"></i>
                <span>分类管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/class">
                  <i class="el-icon-document"></i>
                  <span slot="title">分类</span>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <!-- 首页轮播图 -->
            <el-submenu index="3">
              <template slot="title">
                <i class="el-icon-s-home"></i>
                <span>首页管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/swipe">
                  <i class="el-icon-house"></i>
                  <span slot="title">轮播图</span>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <!-- 订单管理 -->
            <el-submenu index="4">
              <template slot="title">
                <i class="el-icon-present"></i>
                <span>订单管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/orders">
                  <i class="el-icon-bank-card"></i>
                  <span slot="title">订单列表</span>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <!-- 商家店铺 -->
            <el-submenu index="5">
              <template slot="title">
                <i class="el-icon-mobile"></i>
                <span>商家管理</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/brand">
                  <i class="el-icon-takeaway-box"></i>
                  <span slot="title">商家店铺</span>
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </template>
          <el-submenu index="6">
            <template slot="title">
              <i class="el-icon-goods"></i>
              <span>商品管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="/goodslist">
                <i class="el-icon-s-goods"></i>
                <span slot="title">商品列表</span>
              </el-menu-item>
            </el-menu-item-group>
          </el-submenu>
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
    background-image: linear-gradient(90deg, red, yellow);
    // 头部
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-right: 20px;
    // 头部分中的左半部分
    .logo-box {
      display: flex;
      color: white;
      font-size: 22px;
      align-items: center;
      // 禁止被用户选中
      user-select: none;

      img {
        width: 50px;
        height: 50px;
        margin-right: 10px;
        border-radius: 50%;
      }
    }
  }
  .el-aside {
    background-color: rgb(252, 191, 214);
    background-image: linear-gradient(0deg, yellow, red);
  }
  .el-main {
    background-color: rgb(90, 212, 206);
  }
}
</style>