<template>
  <div class="nickname">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="我的昵称" @click-left="onClickLeft" class="left_shop">
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
    <!-- 当前昵称 -->
    <div>
      <van-nav-bar>
        <div slot="title" class="div_title">当前昵称: {{nickname}}</div>
      </van-nav-bar>
      <van-cell-group class="cellGroup">
        <van-field
          :clearable="true"
          v-model="nicknames"
          @input="inputFocus"
          @clear="inputClear"
          placeholder="修改昵称"
        />
      </van-cell-group>
      <van-button
        :disabled="disabledButton"
        style="margin-top:20px;"
        type="danger"
        size="large"
        @click="user_modify_nickname"
      >确认提交</van-button>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false,
      nickname: "",
      nicknames: "",
      // 禁用
      disabledButton: true
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // this.$router.push("/me");
      window.history.back(-1);
    },
    // 回显 用户昵称
    user_echo_nickname() {
      this.$http.get("/user_echo_nickname").then(res => {
        // console.log(res);
        this.nickname = res.data.data.nickname;
      });
    },
    // 修改 用户昵称
    user_modify_nickname() {
      this.$http
        .put("/user_modify_nickname", {
          nickname: this.nicknames
        })
        .then(res => {
          this.$toast.success(res.data.message);
          window.history.back(-1);
        });
    },
    // 触发 输入框
    inputFocus() {
      this.disabledButton = false;
    },
    // 删除 小按钮
    inputClear() {
      this.disabledButton = true;
    }
  },
  created() {
    // 回显 用户昵称
    this.user_echo_nickname();
  }
};
</script>

<style lang="less">
.nickname {
  overflow-x: hidden;
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
  .van-ellipsis {
    overflow: initial;
  }
  .van-nav-bar__title {
    max-width: 100%;
    background-color: #f8f8f8;
  }
  .div_title {
    margin-top: 20px;
    text-align: initial;
    margin-left: 20px;
  }
  .cellGroup {
    padding-left: 20px;
  }
  .van-field__control {
    position: relative;
    top: 8px;
  }
  .van-button--danger {
    color: #fff;
    background-color: #f13149;
    border: 1px solid #f13149;
  }
}
</style>