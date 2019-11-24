<template>
  <div class="myinfo">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="设置" @click-left="onClickLeft" class="left_shop">
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
    <!-- 头像 -->
    <van-nav-bar class="div_credit_pay_one div_credit_pay_xiu">
      <div slot="left" class="div_credit_pay">头像</div>
      <div slot="right" class="div_arrow">
        <van-uploader
          class="pink_imgs pink_img"
          v-model="fileList"
          :deletable="false"
          :after-read="afterRead"
          multiple
          :max-count="1"
        />
      </div>
    </van-nav-bar>

    <!-- 昵称 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">昵称</div>
      <div slot="right" class="div_arrow">
        {{userData.nickname}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 性别 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">性别</div>
      <div slot="right" class="div_arrow">
        {{userData.sex}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 出生日期 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">出生日期</div>
      <div slot="right" class="div_arrow">
        {{userData.birth}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 偏好 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">偏好</div>
      <div slot="right" class="div_arrow">
        {{userData.preference}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 地址管理 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">地址管理</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 我的车牌 -->
    <van-nav-bar class="div_credit_pay_one div_credit_pay_border">
      <div slot="left" class="div_credit_pay">我的车牌</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 安全中心 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">安全中心</div>
      <div slot="right" class="div_arrow">
        修改登录密码、支付密码等
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 发票抬头管理 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">发票抬头管理</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 增票资质 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">增票资质</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 退出 -->
    <van-button type="danger" size="large" @click="userOut">退出当前账号</van-button>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false,
      // 头像
      fileList: [],
      userData: {}
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // console.log(111);
      // window.history.back(-1);
      this.$router.push("/me");
    },
    // 用户信息
    getUserData() {
      this.$http.get("/user_display_all").then(res => {
        // console.log(res);
        this.userData = res.data.data;
      });
    },
    // 退出
    userOut() {
      localStorage.clear();
      this.$router.push("/me");
    },
    // 上传头像
    afterRead(a) {
      console.log(a);
    }
  },
  computed: {
    ...mapState(["id"])
  },
  created() {
    // 渲染 用户信息
    this.getUserData();
  }
};
</script>

<style lang="less">
.myinfo {
  .van-cell {
    padding: 0;
    overflow: none;
    overflow: inherit;
  }

  .van-cell__value {
    overflow: inherit;
  }
  .van-button--small {
    min-width: 75px;
  }
  .van-cell-group {
    height: 40px;
    .default {
      position: relative;
      top: 0px;
      right: 0px;
      .down {
        color: red;
      }
      .default_sapn {
        font-weight: 800;
      }
    }
  }
  .order_sn {
    position: relative;
    top: 10px;
  }
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
  .div_credit_pay_xiu {
    height: 85px;
    line-height: 85px;
  }
  .div_arrow {
    color: #b4b4b4;
    font-size: 13px;
    .arrow {
      margin-left: 5px;
      color: #b4b4b4;
    }
  }
  .div_credit_pay_border {
    border-top: 15px solid #f8f8f8;
  }
  .pink_imgs {
    border-radius: 50%;
    width: 80px;
    height: 80px;
    position: relative;
    top: 7px;
  }

  .van-image__img {
    display: block;
    width: 100%;
    height: 100%;
    position: relative;
    top: 28px;
    border-radius: 50%;
  }
}
</style>