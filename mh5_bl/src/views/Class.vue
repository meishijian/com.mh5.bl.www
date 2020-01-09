<template>
  <div class="box">
    <!-- 导航栏 -->
    <van-nav-bar title="标题">
      <!-- 左边搜索栏 -->
      <div slot="left">
        <van-search placeholder="搜索你想要的商品" disabled="false" @click="goods_tiao" />
      </div>
      <!-- 右边 -->
      <div slot="right">
        <van-icon v-if="icon" name="ellipsis" color="#8d8d8d" size="26px" @click="icon=!icon" />
        <van-icon v-else name="cross" color="red" size="26px" @click="icon=!icon" />
      </div>
    </van-nav-bar>
    <!-- 隐藏显示 导航 -->
    <div class="dahang">
      <van-tabbar class="dahang_tabbar" v-if="icon==false">
        <van-tabbar-item icon="home-o" to="/">首页</van-tabbar-item>
        <van-tabbar-item icon="search" to="/search">搜索</van-tabbar-item>
        <van-tabbar-item icon="bars" to="/class">分类</van-tabbar-item>
        <van-tabbar-item icon="shopping-cart-o" to="/shopping">购物车</van-tabbar-item>
        <van-tabbar-item icon="manager-o" to="/me">我的i百联</van-tabbar-item>
      </van-tabbar>
    </div>
    <van-row>
      <van-col span="6">
        <!-- 商品分类 -->
        <!-- 左边 分类-->
        <van-sidebar v-model="activeKey" class="sidebar" @change="change">
          <van-sidebar-item v-for="(item, index) in goodsDate" :key="index" :title="item.cla_name"></van-sidebar-item>
        </van-sidebar>
      </van-col>
      <van-col span="18">
        <!-- 第一次·循环 循环他的商品名称 -->
        <div v-for="(item, index) in goodsnameDate" :key="index">
          <p class="goodsnameDate_p">{{item.cat_title}}</p>
          <!-- 右边商品 -->
          <!-- 第二层循环 children 循环他的商品图片 介绍 -->
          <van-grid :column-num="3">
            <van-grid-item
              v-for="(item1, index1) in item.children"
              :key="index1"
              @click="children(item1.id)"
            >
              <img class="children_img" :src="item1.sort_image" alt />
              <p class="children_p">{{item1.sort_name}}</p>
            </van-grid-item>
          </van-grid>
        </div>
      </van-col>
    </van-row>
  </div>
</template>
<script>
export default {
  data() {
    return {
      activeKey: 0,
      // activeNames: ["1"]
      // 商品分类
      goodsDate: [],
      // 商品名称
      goodsnameDate: [],
      icon: true
    };
  },
  methods: {
    // 商品分类显示
    goodsList() {
      this.$http.get("/goods_left_side").then(res => {
        // console.log(res);
        this.goodsDate = res.data.data;
      });
    },
    // 点击时 获取右侧分类列表
    change(index) {
      // console.log(index);
      this.$http
        .get("/goods_right_sort", {
          params: { id: index + 1 }
        })
        .then(res => {
          // console.log(res);
          this.goodsnameDate = res.data.data;
        });
    },
    // 商品数量名称显示
    goodsnameList() {
      this.$http
        .get("/goods_right_sort", {
          params: { id: 1 }
        })
        .then(res => {
          // console.log(res);
          this.goodsnameDate = res.data.data;
        });
    },
    children(id) {
      // console.log(id);

      this.$router.push("/goodslist");
      // 把商品id存起来
      localStorage.setItem("id", id);
    },
    goods_tiao() {
      this.$router.push("/search");
    }
  },
  created() {
    this.goodsList();
    this.goodsnameList();
  }
};
</script>
<style lang="less">
.box {
  .search {
    width: 300px;
    position: relative;
    top: 7px;
  }
  .children_img {
    width: 70px;
    height: 70px;
  }
  .children_p {
    font-size: 12px;
    color: #676767;
  }
  .goodsnameDate_p {
    font-size: 11px;
    color: #9a9a9a;
    // color: red;
  }
  .children_li {
    width: 80%;
  }
  .dahang {
    width: 100%;
    // height: 80px;
    // border: 1px solid olive;
  }

  .dahang_tabbar {
    background-color: pink;
    height: 60px;
    // color: red
  }
}
</style>
