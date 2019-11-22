<template>
  <div class="shop">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="购物车" @click-left="onClickLeft" class="left_shop">
      <!-- 右边 -->
      <div slot="right">
        <span class="rigth_span" v-if="submit_dele" @click="submit_dele = !submit_dele">编辑全部</span>
        <span class="rigth_span" v-else @click="submit_dele = !submit_dele">完成</span>
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

    <div class="wenzi" v-if="goodsData==null">
      <img class="dahang_img" src="../assets/img/002.jpg" alt />

      <p class="g_botton" @click="wenzi_home">去逛逛</p>
    </div>
    <div v-else>
      <div style="padding-bottom: 80px;">
        <!-- 商品卡片 -->
        <van-card
          class="vancard"
          :price="item.price"
          :title="item.goods_name"
          :thumb="item.image"
          v-for="(item, index) in goodsData"
          :key="index"
        >
          <!-- 步进器 -->
          <div slot="footer">
            <van-checkbox v-model="cart[item.id].ischk"></van-checkbox>
            <van-stepper min="1" max="200" v-model="cart[item.id].count"></van-stepper>
            <p>小计:{{item.price*cart[item.id].count}}</p>
          </div>
        </van-card>
      </div>

      <!-- 提交订单栏 -->
      <van-submit-bar
        :price="totalPrice"
        :disabled="counts == 0"
        :button-text="submitBarText"
        @submit="onSubmit"
        v-if="submit_dele"
      >
        <van-checkbox v-model="allClick">全选</van-checkbox>
        <span slot="tip">
          你的收货地址不支持同城送,
          <span>修改地址</span>
        </span>
      </van-submit-bar>

      <!-- 删除 -->
      <van-submit-bar @submit="onDelete" button-text="删除" v-else>
        <van-checkbox v-model="allClick" class="allClick_all">全选</van-checkbox>
        <span slot="tip">
          你的收货地址不支持同城送,
          <span>修改地址</span>
        </span>
      </van-submit-bar>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 商品数据数组
      goodsData: [],
      // 把goods_id,cart 从浏览器取出来  转换成数组形式
      goods_id: JSON.parse(localStorage.getItem("goods_id")) || [],
      cart: JSON.parse(localStorage.getItem("cart")) || [],
      // 定义icon 本身为显示 true
      icon: false,
      // 点击 编辑 是否删除
      submit_dele: true,
      // 总算 是否选中
      counts: 0
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // console.log(111);
      window.history.back(-1);
    },
    // 点击逛逛去首页
    wenzi_home() {
      this.$router.push("/");
    },
    // 点击购物车的商品显示
    goodsList() {
      this.$http
        .get("/cart_goods", {
          params: { goods_id: this.goods_id.join(",") }
        })
        .then(res => {
          // console.log(res);
          this.goodsData = res.data.data;
        });
    },
    // 点击结算跳转订单页面
    onSubmit() {
      this.$router.push("/order");
    },
    // 删除
    onDelete() {
      // 订单成功
      let goods_id = JSON.parse(localStorage.getItem("goods_id"));
      // console.log(goods_id);
      this.goodsData.forEach((element, i) => {
        // 删除
        if (this.cart[element.id].ischk == true) {
          // console.log(11);
          this.cart[element.id] = null;
          // goods_id.splice(
          //   goods_id.findIndex(obj => element.id == obj),
          //   1
          // );
        }
      });
      localStorage.setItem("cart", JSON.stringify(this.cart));
      localStorage.setItem("goods_id", JSON.stringify(goods_id));
      this.goodsList();
    }
  },
  // 刷新页面 全选选中不变  用watch监听
  watch: {
    cart: {
      // 深度监听
      deep: true,
      handler: function() {
        // console.log(111);
        // 一点击 就把cart值存放在浏览器中  字符串形式
        localStorage.setItem("cart", JSON.stringify(this.cart));
      }
    }
  },

  // 计算属性
  computed: {
    // 总价
    totalPrice: function() {
      var sum = 0;
      // console.log(this.goodsData);
      if (this.goodsData == undefined) {
        return sum;
      }

      // 每一件商品的价钱加起来  所以要循环
      this.goodsData.forEach(item => {
        // 判断 全选按钮 是否被勾选
        if (this.cart[item.id].ischk) {
          // 总价  价钱加 步进器的数量
          sum += item.price * this.cart[item.id].count;
        }
      });
      return sum * 100;
    },

    // 全选 两次触发
    allClick: {
      // 选中所有的按钮 全选按钮选中
      get: function() {
        // 循环数组 勾选的 cart
        for (let i = 0; i < this.cart.length; i++) {
          // const element = array[i];
          // 判断第一项 是否为空  为空的话就暂停
          if (this.cart[i] == null) continue;
          //再判断全选按钮是否被选中  false是没选中  有一个没选中的都不让全选按钮选中
          if (this.cart[i].ischk == false) {
            return false;
          }
        }
        // 如果每个都选中 就让全选按钮选中
        return true;
      },
      // 点击全选按钮 所有的选项都选中
      set: function(val) {
        console.log(val);
        // val 默认为true
        // // 循环数组
        for (let i = 0; i < this.cart.length; i++) {
          // 判断第一项是否为Null continue 暂停
          if (this.cart[i] == null) continue;
          // 把全选1按钮的 true 状态 赋值给每一项
          this.cart[i].ischk = val;
        }
      }
    },
    // 结算
    submitBarText() {
      let count = 0;
      // 判断 每一个 是否选中 选中 让 步进值 加加
      for (let i = 0; i < this.cart.length; i++) {
        if (this.cart[i] == null) continue;
        if (this.cart[i].ischk) {
          count++;
        }
      }
      // 指向问题 所以定义 _that  当做 this 使用
      let _that = this;
      _that.counts = count;
      return "结算" + (count ? `(${count})` : "");
    }
  },
  created() {
    this.goodsList();
  }
};
</script>

<style lang="less">
.shop {
  .allClick_all {
    position: absolute;
    bottom: 12px;
    left: 0;
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
  .g_botton {
    width: 116px;
    height: 35px;
    color: aliceblue;
    background-color: #fc98a2;
    border-radius: 16px;
    text-align: center;
    line-height: 35px;
    margin: 0;
    padding: 0;
    position: absolute;
    bottom: -58%;
    left: 60%;
  }
  .wenzi {
    position: relative;
    width: 100%;
    height: 100%;
    // border: 1px solid pink;
    // margin: 154px auto;
  }
  .g_pp {
    font-size: 14px;
    text-align: center;
  }
  .g_p {
    font-size: 13px;
    text-align: center;
  }
  .rigth_span {
    margin-right: 13px;
  }
}
</style>

