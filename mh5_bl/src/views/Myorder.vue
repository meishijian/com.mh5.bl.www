<template>
  <div class="shop">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="订单" @click-left="onClickLeft" class="left_shop">
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

    <!-- 内容 标签页 -->
    <van-tabs v-model="active" class="tabs" @click="getTabsData">
      <van-tab title="全部">
        <div v-for="(item, index) in tabsData" :key="index">
          <van-cell-group>
            <van-cell class="order_sn">
              <div slot="title" style="width: 216px;">订单时间：{{item[0].addtime | dateFormat}}</div>
            </van-cell>
          </van-cell-group>
          <img
            :src="item1.goods_image"
            alt
            width="80px"
            v-for="(item1, index1) in item"
            :key="index1"
          />
          <van-cell-group style="margin-top:10px;">
            <van-cell>
              <div slot="title" class="default">
                实付￥
                <span class="default_sapn">{{item[0].total_price}}</span>
              </div>
              <div slot="default" class="default">
                <van-button type="primary" size="small" style="margin-right:20px;">查询详情</van-button>
              </div>
            </van-cell>
          </van-cell-group>
        </div>
      </van-tab>
      <van-tab title="待付款">
        <div v-for="(item, index) in tabsData" :key="index">
          <van-cell-group>
            <van-cell class="order_sn">
              <div slot="title" style="width: 216px;">订单时间：{{item[0].addtime | dateFormat}}</div>
              <div slot="default" class="default">
                <van-count-down class="down" millisecond :time="time" format="HH:mm:ss:SSS"></van-count-down>
              </div>
            </van-cell>
          </van-cell-group>
          <img
            :src="item1.goods_image"
            alt
            width="80px"
            v-for="(item1, index1) in item"
            :key="index1"
          />
          <van-cell-group style="margin-top:10px;">
            <van-cell>
              <div slot="title" class="default">
                实付￥
                <span class="default_sapn">{{item[0].total_price}}</span>
              </div>
              <div slot="default" class="default">
                <van-button type="default" size="small" @click="cancel(item[0].order_id)">取消订单</van-button>
                <van-button
                  type="default"
                  size="small"
                  style="margin:0 20px 0 15px;"
                  @click="pay(item[0])"
                >去支付</van-button>
              </div>
            </van-cell>
          </van-cell-group>
        </div>
      </van-tab>
      <van-tab title="待收货">
        <div v-for="(item, index) in tabsData" :key="index">
          <van-cell-group>
            <van-cell class="order_sn">
              <div slot="title" style="width: 216px;">订单时间：{{item[0].addtime | dateFormat}}</div>
            </van-cell>
          </van-cell-group>
          <img
            :src="item1.goods_image"
            alt
            width="80px"
            v-for="(item1, index1) in item"
            :key="index1"
          />
          <van-cell-group style="margin-top:10px;">
            <van-cell>
              <div slot="title" class="default">
                实付￥
                <span class="default_sapn">{{item[0].total_price}}</span>
              </div>
              <div slot="default" class="default">
                <van-button type="default" size="small" @click="receiving(item[0].order_id)">确认收货</van-button>
                <van-button
                  type="danger"
                  size="small"
                  style="margin:0 20px 0 15px;"
                  @click="retreat(item[0].order_id)"
                >退货</van-button>
              </div>
            </van-cell>
          </van-cell-group>
        </div>
      </van-tab>
      <van-tab title="待评价">
        <div v-for="(item, index) in tabsData" :key="index">
          <van-cell-group>
            <van-cell class="order_sn">
              <div slot="title" style="width: 216px;">订单时间：{{item[0].addtime | dateFormat}}</div>
            </van-cell>
          </van-cell-group>
          <img
            :src="item1.goods_image"
            alt
            width="80px"
            v-for="(item1, index1) in item"
            :key="index1"
          />
          <van-cell-group style="margin-top:10px;">
            <van-cell>
              <div slot="title" class="default">
                实付￥
                <span class="default_sapn">{{item[0].total_price}}</span>
              </div>
              <div slot="default" class="default">
                <van-button
                  type="warning"
                  size="small"
                  style="margin-right:20px;"
                  @click="evaluation(item[0].order_id)"
                >评价</van-button>
              </div>
            </van-cell>
          </van-cell-group>
        </div>
      </van-tab>
    </van-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false,
      // 标签页
      active: this.$route.params.numId - 0,
      tabsData: [],
      time: 30 * 60 * 60 * 1000
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // console.log(111);
      // window.history.back(-1);
      this.$router.push("/me");
    },
    getTabsData() {
      this.$http
        .get("/order_list", {
          params: {
            list_id: this.active
          }
        })
        .then(res => {
          // console.log(res);
          this.tabsData = res.data.data;
        });
    },
    // 取消订单
    cancel(order_id) {
      this.$http
        .get("/order_cancel", {
          params: {
            order_id: order_id
          }
        })
        .then(res => {
          // console.log(res);
          this.$toast(res.data.message);
          this.getTabsData();
        });
    },
    // 确认收货
    receiving(order_id) {
      this.$http
        .get("/order_receiving", {
          params: {
            order_id: order_id
          }
        })
        .then(res => {
          // console.log(res);
          this.$toast(res.data.message);
          this.getTabsData();
        });
    },
    // 退货
    retreat(order_id) {
      this.$http
        .get("/order_retreat", {
          params: {
            order_id: order_id
          }
        })
        .then(res => {
          // console.log(res);
          this.$toast(res.data.message);
          this.getTabsData();
        });
    },
    // 评价
    evaluation(order_id) {
      this.$http
        .get("/order_evaluation", {
          params: {
            order_id: order_id
          }
        })
        .then(res => {
          // console.log(res);
          this.$toast(res.data.message);
          this.getTabsData();
        });
    },
    // 去支付
    pay(item) {
      this.$router.push({
        path: "/payment",
        query: {
          orderId: item.order_id
        }
      });
      localStorage.setItem("totalPrices", item.total_price);
    }
  },

  created() {
    this.getTabsData();
  }
};
</script>

<style lang="less">
.shop {
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
}
</style>

