<template>
  <div class="detail">
    <div style="
    padding-bottom: 50px;">
      <van-nav-bar left-arrow @click-left="onClickLeft">
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

      <van-swipe class="goods-swipe" :autoplay="3000">
        <van-swipe-item v-for="(item, index) in goodsDetail.goods_swipe_pic" :key="index">
          <img class="swipe_img" :src="item" />
        </van-swipe-item>
      </van-swipe>

      <van-cell-group>
        <van-cell>
          <div class="goods-price">{{ goodsDetail.price }}</div>
          <div class="goods-title">{{ goodsDetail.goods_name }}</div>
        </van-cell>
        <!-- <van-cell class="goods-express"></van-cell> -->
      </van-cell-group>

      <van-cell-group class="goods-cell-group">
        <van-cell value="进入店铺" icon="shop-o" is-link @click="sorry">
          <template slot="title">
            <span class="van-cell-text">有赞的店</span>
            <van-tag class="goods-tag" type="danger">官方</van-tag>
          </template>
        </van-cell>
        <!-- <van-address-edit :area-list="areaList" :search-result="searchResult" /> -->
        <van-cell title="送至：" icon="location-o" is-link @click="address"></van-cell>
        <!-- 地址 -->
        <van-action-sheet v-model="show">
          <van-area
            :area-list="areaList"
            :value="areaValue"
            @cancel="onCancel"
            @confirm="onCancel"
          />
        </van-action-sheet>
      </van-cell-group>

      <van-cell-group class="goods-cell-group">
        <!-- 商品店铺名称 -->
        <div class="goods-group">
          <img class="goods_img" :src="goodsDetail.bra_image" alt />
          <p class="goods_p">{{goodsDetail.bra_name}}</p>
        </div>
      </van-cell-group>
      <van-tabs @click="van_tab">
        <van-tab title="热门商品">
          <van-grid class="grid" :border="false">
            <van-grid-item v-for="(item, index) in commodity" :key="index" icon="photo-o" text="文字">
              <img class="rm_img" :src="item.image" alt />
              <p class="rm_name">{{item.goods_name.slice(0,16)}}</p>
              <p class="rm_price">￥ {{item.price}}</p>
            </van-grid-item>
          </van-grid>
        </van-tab>
        <van-tab title="买了还买">
          <van-grid class="grid">
            <van-grid-item v-for="(item, index) in commodity" :key="index" icon="photo-o" text="文字">
              <img class="rm_img" :src="item.image" alt />
              <p class="rm_name">{{item.goods_name.slice(0,16)}}</p>
              <p class="rm_price">￥ {{item.price}}</p>
            </van-grid-item>
          </van-grid>
        </van-tab>
        <van-tab title="大家都在看">
          <van-grid class="grid">
            <van-grid-item v-for="(item, index) in commodity" :key="index" icon="photo-o" text="文字">
              <img class="rm_img" :src="item.image" alt />
              <p class="rm_name">{{item.goods_name.slice(0,16)}}</p>
              <p class="rm_price">￥ {{item.price}}</p>
            </van-grid-item>
          </van-grid>
        </van-tab>
      </van-tabs>
      <div class="tuwen">图文详情</div>
      <!--商品介绍 -->
      <img
        :src="item"
        width="100%"
        v-for="(item, index) in goodsDetail.goods_details_pic"
        :key="index"
      />
    </div>

    <van-goods-action class="goods_action">
      <van-goods-action-icon icon="chat-o">客服</van-goods-action-icon>
      <van-goods-action-icon
        icon="cart-o"
        @click="shoping_click"
        :info="JSON.parse(infoData).length == false ? '' : JSON.parse(infoData).length"
      >购物车</van-goods-action-icon>
      <van-goods-action-button type="warning" @click="sku_shows">加入购物车</van-goods-action-button>
      <van-goods-action-button type="danger" @click="sku_sorrys">立即购买</van-goods-action-button>
    </van-goods-action>
    <!-- 加入购物车 -->
    <van-popup
      v-model="sku_show"
      :round="true"
      closeable
      position="bottom"
      :style="{ height: '60%' }"
      class="popup"
    >
      <van-panel :icon="goodsDetail.image" :title="'￥' + goodsDetail.price" desc="有货"></van-panel>
      <van-row gutter="110" class="row_gutter">
        <van-col span="13" class="row_col_one">
          数量
          <span class="row_col_one_span">每单限购50件</span>
        </van-col>
        <van-col span="10">
          <van-stepper v-model="stepper_value" max="50" />
        </van-col>
      </van-row>
      <van-button
        class="button_large"
        size="large"
        type="warning"
        @click="addShop(goodsDetail.id)"
      >确定</van-button>
    </van-popup>
    <!-- 立即购买 -->
    <van-popup
      v-model="sku_sorry"
      :round="true"
      closeable
      position="bottom"
      :style="{ height: '60%' }"
      class="popup"
    >
      <van-panel :icon="goodsDetail.image" :title="'￥' + goodsDetail.price" desc="有货"></van-panel>
      <van-row gutter="110" class="row_gutter">
        <van-col span="13" class="row_col_one">
          数量
          <span class="row_col_one_span">每单限购50件</span>
        </van-col>
        <van-col span="10">
          <van-stepper v-model="sorry_value" max="50" />
        </van-col>
      </van-row>
      <van-button class="button_large" size="large" type="warning" @click="orderSorry">确定</van-button>
    </van-popup>
  </div>
</template>
<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      areaValue: "440105",
      areaList: {
        province_list: {
          110000: "北京市",
          120000: "天津市"
        },
        city_list: {
          110100: "北京市",
          110200: "县",
          120100: "天津市",
          120200: "县"
        },
        county_list: {
          110101: "东城区",
          110102: "西城区",
          110105: "朝阳区",
          110106: "丰台区",
          120101: "和平区",
          120102: "河东区",
          120103: "河西区",
          120104: "南开区",
          120105: "河北区"
          // ....
        }
      },
      // 图标默认显示true
      icon: true,
      // 商品数据
      goodsDetail: [],
      // 热门商品
      commodity: [],
      // 选择地址
      show: false,
      actions: [
        { name: "选项" },
        { name: "选项" },
        { name: "选项", subname: "描述信息" }
      ],
      // 加入购物车
      sku_show: false,
      // 加入购物车 步进器
      stepper_value: 1,
      // 立即购买
      sku_sorry: false,
      // 加入购物车 步进器
      sorry_value: 1
    };
  },
  methods: {
    ...mapMutations(["getInfoData"]),
    sorry() {},
    sku_shows() {
      this.sku_show = true;
    },
    // 点击箭头返回
    onClickLeft() {
      window.history.back(-1);
    },
    // 渲染数据
    goodsDeta() {
      // 从浏览器拿出存放的id
      let list_id = localStorage.getItem("list_id");
      this.$http
        .get("/goods_details", {
          params: { id: list_id }
        })
        .then(res => {
          this.goodsDetail = res.data.data;
          // console.log(res);
          this.goodsDetail.goods_details_pic.sort(function(a, b) {
            return a.localeCompare(b);
          });
          // console.log(this.goodsDetail);
        });
    },
    // 热门商品
    commodityList() {
      this.$http
        .get("/goods_hot_shop", {
          params: { brand_id: this.goodsDetail.bra_id }
        })
        .then(res => {
          this.commodity = res.data.data;
          // console.log(res);
        });
    },
    // 每次一点击调用
    van_tab() {
      this.commodityList();
    },
    onClickCart() {
      this.$router.push("cart");
    },
    // 选择地址 弹出框显示
    address() {
      this.show = true;
    },

    // 选择地址 取消
    onCancel() {
      this.show = false;
    },
    // 跳转到 购物车
    shoping_click() {
      this.$router.push("/shopping");
    },
    // 加入购物车
    addShop(id) {
      // 成功提示
      // this.$toast("提示文案");
      this.$toast.success("添加商品成功");
      // console.log(id);
      // 把id从浏览器取出来
      let goods_id = localStorage.getItem("goods_id");
      // 判断 添加数据的第一条是不是为Null
      if (goods_id == null) {
        // 定义一个空数组
        (goods_id = []),
          // 把需要的Id 数据放进去
          goods_id.push(id);
      } else {
        // 如果有数据的话 就转换成数组形式
        goods_id = JSON.parse(goods_id);
        // 再把需要的id  push进去
        goods_id.push(id);
        // 防止重复
        goods_id = Array.from(new Set(goods_id));
      }
      // 最后把数据放进浏览器  字符串形式
      localStorage.setItem("goods_id", JSON.stringify(goods_id));

      // 把cart 从浏览器取出
      let cart = localStorage.getItem("cart");
      // 添加数据 要判断第一条是不是null
      if (cart === null) {
        // 定义一个空数组
        cart = [];
        // 把需要的id数据放进去
        cart[id] = {
          // 默认勾选
          ischk: false,
          // 总数量
          count: this.stepper_value
        };
      } else {
        // 有数据的时候 转换成数组形式
        cart = JSON.parse(cart);
        // 没有数据就添加默认数据
        if (cart[id] === null || cart[id] == undefined) {
          // 数据添加
          cart[id] = {
            // 默认勾选
            ischk: false,
            // 总数量
            count: this.stepper_value
          };
        } else {
          // 数量加加
          cart[id].count += this.stepper_value;
        }
      }
      // 最后把 cart 添加到浏览器 字符串形式
      localStorage.setItem("cart", JSON.stringify(cart));
      /**---------------购物车的数量-------------------------*/
      // console.log(id);
      // 购物车的数量 也就是 添加了多少 商品的长度
      this.getInfoData(goods_id.length);
    },
    // 立即购买
    sku_sorrys() {
      this.sku_sorry = true;
    },
    //
    orderSorry() {
      localStorage.setItem("orderSorry_id", this.goodsDetail.id);
      localStorage.setItem("orderSorry_cart", this.sorry_value);
      this.$router.push("/orderSorry");
    }
  },
  created() {
    // this.van_tab();
    this.goodsDeta();
    // 因为用到了  goodsDetail 里面的id
    setTimeout(() => {
      this.commodityList();
    }, 500);
  },
  computed: {
    // 隱射
    ...mapState(["infoData"])
  }
};
</script>

<style lang="less" >
.detail {
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
  .swipe_img {
    width: 340px;
    height: 297px;
  }
  .goods-price {
    color: #f44;
    font-size: 18px;
  }
  .goods-title {
    font-size: 17px;
    margin-top: 4px;
  }
  .van-tag--danger {
    background-color: #ff6f6f;
    /* background-color: #ee0a24; */
  }
  .van-goods-action-button--warning {
    border-radius: 0;
    // background-color: #ff6f6f;
    background: linear-gradient(to right, #ff6f6f, #ff6f6f);
    height: 51px;
  }
  .van-goods-action-button--danger {
    border-radius: 0;
    // background-color: #333333;
    background: linear-gradient(to right, #333333, #333333);

    height: 51px;
  }
  .goods-group {
    width: 372px;
    height: 46px;
    border-bottom: 8px solid #f8f8f8;
    border-top: 8px solid #f8f8f8;
  }
  .goods_img {
    width: 80px;
    height: 48px;
    margin-left: 11px;
  }
  .goods_p {
    margin-top: -40px;
    margin-left: 100px;
    font-size: 16px;
  }
  .grid .rm_img {
    width: 109px;
    height: 90px;
  }
  .grid .rm_name {
    font-size: 13px;
    color: #838383;
  }
  .grid .rm_price {
    margin-top: -1px;
    margin-left: -67px;
    font-size: 14px;
  }
  .goods_action {
    // bottom: 2px;
    right: -5px;
  }
  .van-grid-item {
    margin-top: 20px;
  }
  .grid .jieshao {
    width: 375px;
  }
  .tuwen {
    width: 150px;
    height: 40px;
    background-color: #333333;
    color: #f8f8f8;
    font-size: 14px;
    border-radius: 27px;
    text-align: center;
    line-height: 40px;
    margin-left: 109px;
    margin-top: 19px;
  }
  .paid_p_span {
    position: absolute;
    top: -29px;
    right: -1px;
    display: inline-block;
    background-color: #ff6f6f;
    border-radius: 50%;
    width: 14px;
    height: 15px;
    line-height: 15px;
    color: #fff;
    font-size: 12px;
    text-align: center;
  }
  .popup {
    overflow-x: hidden;
    .van-cell {
      height: 160px;
    }
    .van-icon__image {
      width: 150px;
      height: 150px;
    }
    .van-image {
      top: 0;
    }
    .van-cell__title {
      margin-top: 18px;
    }
  }
  .row_gutter {
    margin-top: 20px;
    .row_col_one {
      margin-left: 10px;
      font-size: 13px;
      .row_col_one_span {
        margin-left: 10px;
        color: #ff7373;
      }
    }
  }
  .button_large {
    margin-top: 142px;
    background-color: #ff6f6f;
  }
}

&-swipe {
  img {
    width: 100%;
    display: block;
  }
}
&-title {
  font-size: 16px;
}
&-price {
  color: #f44;
}
&-express {
  color: #999;
  font-size: 12px;
  padding: 5px 15px;
}
&-cell-group {
  margin: 15px 0;
  .van-cell__value {
    color: #999;
  }
}
&-tag {
  margin-left: 5px;
}
.grid .van-grid-item__content {
  padding: 0;
}
</style>