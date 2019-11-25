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
      <van-contact-card
        @click="order"
        :type="cardType"
        :name="currentContact.name"
        :tel="currentContact.tel"
      ></van-contact-card>
      <!-- 支付方式 -->
      <van-cell title="支付方式" is-link @click="show= !show"></van-cell>
      <van-action-sheet v-model="show" cancel-text="取消">
        <van-radio-group v-model="radio">
          <van-cell-group>
            <van-cell title="在线支付" clickable @click="radio = '1'">
              <van-radio slot="right-icon" name="1" />
            </van-cell>
            <van-cell title="货到付款" clickable @click="radio = '2'">
              <van-radio slot="right-icon" name="2" />
            </van-cell>
          </van-cell-group>
        </van-radio-group>
      </van-action-sheet>

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
      <van-nav-bar class="submit" left-text="配送方式">
        <van-radio-group v-model="radios" slot="right">
          <van-radio name="1" class="wu">物流配送</van-radio>
          <van-radio name="2" class="men">门店自提</van-radio>
        </van-radio-group>
      </van-nav-bar>
    </div>
    <!-- 付钱 -->
    <van-submit-bar class="submit" :price="totalPrices" button-text="提交订单" @submit="onSubmit" />
  </div>
</template>

<script>
import { mapMutations } from "vuex";

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
      show: false,
      radio: "1",
      radios: "1",
      list: [
        {
          name: "s",
          tel: "s",
          id: 0
        }
      ],
      // show: false,
      address: localStorage.getItem("address") || 0
    };
  },
  methods: {
    ...mapMutations(["getInfoData"]),
    //   返回上一级
    onClickLeft() {
      window.history.back(-1);
    },
    order() {
      this.showList = true;
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
    // 提交订单
    onSubmit() {
      // console.log(this.totalPrices);
      // console.log(this.goodsData);
      localStorage.setItem("totalPrices", this.totalPrices / 100);

      let carts = [];
      // cart 参数
      this.goodsData.forEach((element, i) => {
        carts.push({
          goods_id: element.id,
          buy_count: this.cart[element.id].count
        });
      });
      // console.log(carts);
      this.$http
        .post("/orders", {
          address_id: this.chosenContactId,
          cart: carts
        })
        .then(res => {
          // console.log(res);
          // 订单成功
          let goods_id = JSON.parse(localStorage.getItem("goods_id"));
          // console.log(goods_id);
          this.goodsData.forEach((element, i) => {
            // 删除
            if (this.cart[element.id].ischk == true) {
              // console.log(11);
              this.cart[element.id] = null;
            }
            goods_id.splice(
              goods_id.findIndex(obj => element.id == obj),
              1
            );
          });
          this.$router.push({
            path: "/payment",
            query: {
              orderId: res.data.data.orderId
            }
          });
          localStorage.setItem("cart", JSON.stringify(this.cart));
          localStorage.setItem("goods_id", JSON.stringify(goods_id));
          /**---------------购物车的数量-------------------------*/
          // console.log(id);
          // 购物车的数量 也就是 添加了多少 商品的长度
          this.getInfoData(goods_id.length);
        });
    },
    // 选中联系人
    onSelect() {
      this.showList = false;
    },
    // 获取收货 地址 信息
    getList() {
      console.log(this.address);
      
      this.$http
        .get("/address_single", {
          params: {
            id: this.address
          }
        })
        .then(res => {
          // console.log(res);
          this.list[0].name = res.data.data[0].shr_name;
          this.list[0].tel = res.data.data[0].mobile;
          this.list[0].id = res.data.data[0].id;
          this.chosenContactId = res.data.data[0].id;
          // console.log(this.list);
        });
    }
  },
  computed: {
    cardType() {
      return this.chosenContactId !== null ? "edit" : "add";
    },
    currentContact() {
      const id = this.chosenContactId;
      return id !== null ? this.list.filter(item => item.id === id)[0] : {};
    },
    // 总价钱
    totalPrices() {
      // 先循环数组
      // 定义一个变量存放总价钱
      let sum = 0;
      this.goodsData.forEach(item => {
        // console.log(item);
        // 总价钱
        sum += item.price * this.cart[item.id].count;
      });
      return sum * 100;
    }
  },
  created() {
    this.order_shop();
    this.getList();
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
  .men {
    position: relative;
    top: -11px;
  }
  .wu {
    position: relative;
    top: 9px;
    /* display: inline-block; */
    margin-left: -144px;
    /* margin-top: 4px; */
  }
}
</style>
  