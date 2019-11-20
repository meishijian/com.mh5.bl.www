<template>
  <div class="detail">
    <van-nav-bar left-arrow @click="onClickLeft">
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
        <van-tabbar-item icon="shopping-cart-o" to="/">购物车</van-tabbar-item>
        <van-tabbar-item icon="manager-o" to="/me">我的i百联</van-tabbar-item>
      </van-tabbar>
    </div>

    <van-swipe class="goods-swipe" :autoplay="3000">
      <van-swipe-item>
        <img class="swipe_img" :src="goodsDetail.image" />
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
      <van-cell title="送至：" icon="location-o" is-link @click="address"></van-cell>
      <!-- 地址 -->
      <van-action-sheet v-model="show">
        <van-area :area-list="areaList" value="110101" @cancel="onCancel" @confirm="onCancel" />
      </van-action-sheet>
    </van-cell-group>

    <van-cell-group class="goods-cell-group">
      <van-cell title="查看商品详情" is-link @click="sorry" />
    </van-cell-group>

    <van-goods-action>
      <van-goods-action-icon icon="chat-o" @click="sorry">客服</van-goods-action-icon>
      <van-goods-action-icon icon="cart-o" @click="onClickCart">购物车</van-goods-action-icon>
      <van-goods-action-button type="warning" @click="sorry">加入购物车</van-goods-action-button>
      <van-goods-action-button type="danger" @click="sorry">立即购买</van-goods-action-button>
    </van-goods-action>
  </div>
</template>
  <script>
export default {
  data() {
    return {
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
      // 选择地址
      show: false,
      actions: [
        { name: "选项" },
        { name: "选项" },
        { name: "选项", subname: "描述信息" }
      ]
    };
  },
  methods: {
    // 点击箭头返回
    onClickLeft() {
      this.$router.push("/goodslist");
    },
    // 渲染数据
    goodsDeta() {
      // 从浏览器拿出存放的id
      let list_id = localStorage.getItem("list_id");
      this.$http
        .get("/goods_detail", {
          params: { id: list_id }
        })
        .then(res => {
          this.goodsDetail = res.data.data;
          console.log(res);
        });
    },
    onClickCart() {
      this.$router.push("cart");
    },
    // 选择地址 弹出框显示
    address() {
      this.show = true;
    },
    sorry() {},
    // 选择地址 取消
    onCancel() {
      this.show = false;
    }
  },
  created() {
    // this.onClickLeft();
    this.goodsDeta();
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
</style>