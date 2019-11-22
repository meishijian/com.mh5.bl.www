<template>
  <div class="order">
    <div class="order_margin">
      <!-- 顶部导航  左边 -->
      <van-nav-bar left-arrow title="确认订单" @click-left="onClickLeft" class="left_shop">
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

      <!-- ---------------------------- -->
      <!-- 联系人卡片 -->
      <van-contact-card @click="order"></van-contact-card>
      <!-- 支付方式 -->
      <van-nav-bar left-text="支付方式" right-text="在线支付>" @click-right="onClickRight" />
      <!-- 商品信息 -->
      <van-grid>
        <!-- 商品卡片 -->
        <van-card
          :price="item.price"
          :title="item.goods_name.slice(0,20)"
          :thumb="item.image"
          v-for="(item, index) in goodsData"
          :key="index"
        >
          <div slot="footer">
            <p class="shu">×{{cart[item.id].count}}</p>
            <p class="mian">免邮</p>
            <hr class="hr" />
            <p>
              合计:
              <span class="qian">￥{{item.price*cart[item.id].count}}</span>
            </p>
          </div>
          <div slot="tags">
            <p class="qitian1">七天无理由退换货</p>
          </div>
        </van-card>
      </van-grid>

      <!-- 配送方式 -->
      <van-nav-bar left-text="支付方式" right-text="在线支付>" @click-right="onClickRight" />
      <!-- 配送时间 -->
      <van-nav-bar left-text="支付方式" right-text="在线支付>" @click-right="onClickRight" />
    </div>
    <!-- 付钱 -->
    <van-submit-bar :price="3050" button-text="提交订单" @submit="onSubmit" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 获取cart 转换成字符串
      cart: JSON.parse(localStorage.getItem("cart")),
      // 放商品数据
      goodsData: [],

      chosenContactId: null,
      editingContact: {},
      showList: false,
      showEdit: false,
      isEdit: false,
      icon: false,
      show: false
    };
  },
  methods: {
    //   返回上一级
    onClickLeft() {
      window.history.back(-1);
    },
    order() {
      this.$router.push("/address");
    },
    // 显示需要买的数据
    order_shop() {
      // 转换成数组形式
      let goods_id = JSON.parse(localStorage.getItem("goods_id"));
      let cart = JSON.parse(localStorage.getItem("cart"));
      // 定义一个变量接受goods_id
      let str = [];
      // 序号每一个goods_id
      goods_id.forEach(item => {
        // 判断 每一个cart里面的勾选是否等于true
        if (cart[item].ischk == true) {
          // 如果·有被勾选的 数据· 就把对应的id赋值给新的变量
          str.push(item);
        }
      });
      // console.log(str);

      this.$http
        .get("/cart_goods", {
          params: { goods_id: str.join(",") }
        })
        .then(res => {
          // console.log(res);
          this.goodsData = res.data.data;
        });
    },

    onClickRight() {},

    // 选中联系人
    onSelect() {
      this.showList = false;
    },
    onSubmit() {}
  },
  computed: {
    cardType() {
      return this.chosenContactId !== null ? "edit" : "add";
    },

    currentContact() {
      const id = this.chosenContactId;
      return id !== null ? this.list.filter(item => item.id === id)[0] : {};
    }
  },
  created() {
    this.order_shop();
  }
};
</script>

<style lang="less">
.order {
  .order_margin {
    margin-bottom: 50px;
  }
  .dahang_tabbar {
    background-color: pink;
    height: 60px;
    // color: red
  }
  .van-card {
    width: 374px;
    position: relative;
    box-sizing: border-box;
    padding: 10px 16px;
    color: #323233;
    font-size: 13px;
    background-color: #fafafa;
  }
  .qitian1 {
    width: 180px;
    height: 20px;
    background-color: #008df0;
    color: #fafafa;
    font-size: 11px;
    border-radius: 10px;
    text-align: center;
    line-height: 20px;
    margin-top: 20px;
  }
  .van-card__title {
    font-size: 10px;
    max-height: 32px;
    font-weight: 500;
    line-height: 16px;
    margin-top: 8px;
  }
  .van-card__price {
    font-size: 12px;
    display: inline-block;
    color: #ee0a24;
    font-weight: 500;
    color: #323233;
    position: relative;
    left: 200px;
    top: -71px;
  }
  .qitian1 {
    width: 146px;
    height: 21px;
    background-color: #008df0;
    color: #fafafa;
    font-size: 11px;
    border-radius: 10px;
    text-align: center;
    line-height: 21px;
  }
  .mian {
    margin-top: -26px;
    font-size: 14px;
  }
  .qian {
    color: #ee0a24;
    font-weight: 700;
  }
  .shu {
    margin-top: -25px;
    position: ru;
    position: relative;
    top: -26px;
  }
  .hr {
    background-color: #ededed;
  }
  .van-nav-bar__text {
    display: inline-block;
    margin: 0 -16px;
    padding: 0 16px;
    /* color: #1989fa; */
    vertical-align: middle;
  }
}
</style>
  