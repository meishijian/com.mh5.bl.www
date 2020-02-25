<template>
  <div class="me">
    <!-- 没登录 -->
    <div class="bottom" v-if="token== null" @click="isLogin">
      <!-- 导航 -->
      <van-nav-bar title="个人中心" left-arrow @click-left="onClickLeft" />
      <!-- 大红色背景 -->
      <div class="pink">
        <img class="pink_img" :src="image + 'she.png'" alt />
        <img class="pink_imgs" :src="image + 'shareLogo.png'" alt />
        <span class="login">登录/</span>
        <span class="zhuce">注册</span>
      </div>
      <!-- 图片 -->
      <!-- <img class="tup" src="https://img23.iblimg.com/market-3/images/activity/285948628.jpg" alt /> -->
      <!-- 收藏福利人人惠 -->
      <van-grid :column-num="3">
        <van-grid-item :icon="image + 'ia_100000001.png'" text="我的收藏"></van-grid-item>
        <van-grid-item :icon="image + 'ia_100000002.png'" text="我的福利"></van-grid-item>
        <van-grid-item :icon="image + 'ia_100000003.png'" text="人人惠"></van-grid-item>
      </van-grid>
      <!-- 积分 优惠劵 -->
      <van-grid :column-num="5" class="van_grid_ji">
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">0</p>
            <p class="p">积分</p>
          </div>
        </van-grid-item>
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">0</p>
            <p class="p">优惠劵</p>
          </div>
        </van-grid-item>
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">0</p>
            <p class="p">电子卡</p>
          </div>
        </van-grid-item>
        <van-grid-item icon="qr" text="会员支付"></van-grid-item>
        <van-grid-item icon="pending-payment" text="我的钱包"></van-grid-item>
      </van-grid>
      <!-- 收货 -->
      <van-grid :column-num="5" class="van_grid_ji">
        <van-grid-item icon="paid" text="待付款"></van-grid-item>
        <van-grid-item icon="logistics" text="待收货"></van-grid-item>
        <van-grid-item icon="comment-o" text="待评价"></van-grid-item>
        <van-grid-item icon="balance-pay" text="售后"></van-grid-item>
        <van-grid-item icon="description" text="我的订单"></van-grid-item>
      </van-grid>

      <!-- 银行卡活动 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="credit-pay" class="credit_pay" />银行卡活动
        </div>
        <div slot="right" class="div_arrow">
          每周六150减30元
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
      <!-- 免费零流量 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="bulb-o" class="credit_pay" />免费零流量
        </div>
        <div slot="right" class="div_arrow">
          线上线下笔笔消费送流量
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
      <!-- 发票中心 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="fire-o" class="credit_pay" />发票中心
        </div>
        <div slot="right" class="div_arrow">
          联华线下订单电子发票
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 服务承诺 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="star-o" class="credit_pay" />服务承诺
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 联系客服 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="service-o" class="credit_pay" />联系客服
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 帮助中心 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="question-o" class="credit_pay" />帮助中心
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
    </div>
    <!-- 已登录 -->
    <div class="bottom" v-else @click="isLogin">
      <!-- 导航 -->
      <van-nav-bar title="个人中心" left-arrow @click-left="onClickLeft" />
      <!-- 大红色背景 -->
      <div class="pink">
        <img class="pink_img" :src="url + 'she.png'" alt @click="myInfo" />
        <!-- shareLogo.png -->
        <img class="pink_imgs" v-if="token== null" :src="url + 'shareLogo.png'" alt />
        <van-uploader
          v-model="fileList"
          v-else
          :deletable="false"
          class="pink_imgs"
          :max-count="1"
        />
        <span class="login">{{nickname}}</span>
      </div>
      <!-- 收藏福利人人惠 -->
      <van-grid :column-num="3">
        <van-grid-item :icon="url + 'ia_100000001.png'" text="我的收藏"></van-grid-item>
        <van-grid-item :icon="url + 'ia_100000002.png'" text="我的福利"></van-grid-item>
        <van-grid-item :icon="url + 'ia_100000003.png'" text="人人惠"></van-grid-item>
      </van-grid>
      <!-- 积分 优惠劵 -->
      <van-grid :column-num="5" class="van_grid_ji">
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">{{integral}}</p>
            <p class="p">积分</p>
          </div>
        </van-grid-item>
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">0</p>
            <p class="p">优惠劵</p>
          </div>
        </van-grid-item>
        <van-grid-item>
          <div slot="text">
            <p class="p p_one">0</p>
            <p class="p">电子卡</p>
          </div>
        </van-grid-item>
        <van-grid-item icon="qr" text="会员支付"></van-grid-item>
        <van-grid-item icon="pending-payment" text="我的钱包"></van-grid-item>
      </van-grid>
      <!-- 收货 -->
      <van-grid :column-num="5" class="van_grid_ji">
        <van-grid-item icon="paid" text="待付款" to="/myorder/1">
          <div slot="text">
            <p class="paid_p">待付款</p>
            <span class="paid_p_i" v-if="statusData.payment > 0">{{statusData.payment}}</span>
          </div>
        </van-grid-item>
        <van-grid-item icon="logistics" text="待收货" to="/myorder/2">
          <div slot="text">
            <p class="paid_p">待收货</p>
            <span class="paid_p_i" v-if="statusData.receiving >0">{{statusData.receiving}}</span>
          </div>
        </van-grid-item>
        <van-grid-item icon="comment-o" text="待评价" to="/myorder/3">
          <div slot="text">
            <p class="paid_p">待评价</p>
            <span class="paid_p_i" v-if="statusData.evaluate > 0">{{statusData.evaluate}}</span>
          </div>
        </van-grid-item>
        <van-grid-item icon="balance-pay" text="售后">
          <div slot="text">
            <p class="paid_p">售后</p>
            <span class="paid_p_i" v-if="statusData.sale > 0">{{statusData.sale}}</span>
          </div>
        </van-grid-item>
        <van-grid-item icon="description" text="我的订单" to="/myorder/0"></van-grid-item>
      </van-grid>

      <!-- 银行卡活动 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="credit-pay" class="credit_pay" />银行卡活动
        </div>
        <div slot="right" class="div_arrow">
          每周六150减30元
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
      <!-- 免费零流量 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="bulb-o" class="credit_pay" />免费零流量
        </div>
        <div slot="right" class="div_arrow">
          线上线下笔笔消费送流量
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
      <!-- 发票中心 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="fire-o" class="credit_pay" />发票中心
        </div>
        <div slot="right" class="div_arrow">
          联华线下订单电子发票
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 服务承诺 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="star-o" class="credit_pay" />服务承诺
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 联系客服 -->
      <van-nav-bar class="div_credit_pay_one">
        <div slot="left" class="div_credit_pay">
          <van-icon name="service-o" class="credit_pay" />联系客服
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>

      <!-- 帮助中心 -->
      <van-nav-bar>
        <div slot="left" class="div_credit_pay">
          <van-icon name="question-o" class="credit_pay" />帮助中心
        </div>
        <div slot="right" class="div_arrow">
          <!-- 联华线下订单电子发票 -->
          <van-icon name="play" class="arrow" />
        </div>
      </van-nav-bar>
    </div>

    <h3 class="div_credit_pay_one h3">为你推荐</h3>
    <!-- list 列表 -->
    <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
      <!-- 宫格 -->
      <van-grid :column-num="2">
        <van-grid-item v-for="(item, index) in likeData" :key="index" @click="like_shop(item.id)">
          <img class="like_img" :src="item.image" alt />
          <!-- <van-tag plain class="like_biao">看相似</van-tag> -->
          <p class="like_p">{{item.goods_name.slice(0,20)}}</p>
          <p class="like_jia">￥{{item.price}}</p>
        </van-grid-item>
      </van-grid>
    </van-list>
    <!-- 底部 -->
    <van-tabbar :route="true">
      <van-tabbar-item icon="wap-home-o" to="/">首页</van-tabbar-item>
      <van-tabbar-item icon="coupon-o" to="/class">分类</van-tabbar-item>
      <van-tabbar-item icon="shopping-cart-o" to="/shopping">
        <span
          class="paid_p_span"
          v-if="JSON.parse(infoData).length == 0"
        >{{JSON.parse(infoData).length}}</span>购物车
      </van-tabbar-item>
      <van-tabbar-item icon="manager-o" to="/me">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
import { image } from "../config.js";
import { mapState } from "vuex";
export default {
  data() {
    return {
      image: image,
      // list列表 加载
      loading: false,
      finished: false,
      // token
      token: localStorage.getItem("token"),
      // 商品 数据
      likeData: [],
      // 头像
      fileList: [
        {
          url: "http://m.chenmsj.com:59885/api/v1/public/image/70.jpg",
          isImage: true
        }
      ],
      // 积分
      integral: 0,
      // 昵称
      nickname: "",
      // 订单管理 显示 数据
      statusData: { payment: 0, receiving: 0, evaluate: 0, sale: 0 }
    };
  },
  methods: {
    //   返回箭头
    onClickLeft() {
      this.$router.push("/");
    },
    // 跳转登录接口
    isLogin() {
      if (!this.token) {
        this.$router.push("/login");
      }
    },
    // 猜你喜欢 每个暑假都得跳转页面
    like_shop(id) {
      // 先把每个商品的id存放起来  跳进同一个组件
      localStorage.setItem("list_id", id);
      // 跳转路由
      this.$router.push("/goodsDetail");
    },
    // 滚动
    onLoad() {
      setTimeout(() => {
        this.$http.get("/guess").then(res => {
          // console.log(res);
          // this.likeData = res.data.data;
          // console.log(this.qualityData);
          this.likeData.push(...res.data.data);
        });

        // 加载状态结束
        this.loading = false;

        // 数据全部加载完成
        if (this.likeData.length >= 40) {
          this.finished = true;
        }
      }, 1000);
    },
    // 首页 获取 信息
    users() {
      this.$http.get("/users").then(res => {
        // console.log(res);
        if (res.data.code !== 200) {
          return;
        }
        this.integral = res.data.data.integral;
        this.nickname = res.data.data.nickname;
        this.fileList[0].url = res.data.data.face;
      });
    },
    // 订单管理 显示
    order_status() {
      this.$http.get("/order_status").then(res => {
        // console.log(res);
        this.statusData = res.data.data;
        // console.log(this.statusData);
      });
    },
    // 我的 界面
    myInfo() {
      this.$router.push("/myInfo");
    }
  },
  created() {
    // 渲染 首页 获取 信息
    this.users();
    // 渲染  订单管理 显示
    this.order_status();
  },
  computed: {
    // 隱射
    ...mapState(["infoData"])
  }
};
</script>
<style lang="less" >
.me {
  .pink {
    width: 375px;
    height: 130px;
    background-color: #e23b43;
    .van-uploader__upload {
      border-radius: 50%;
      width: 80px;
      height: 80px;
    }
  }
  .pink_img {
    position: relative;
    top: 3px;
    left: 335px;
    display: block;
    width: 32px;
    height: 31px;
  }
  .pink_imgs {
    border-radius: 50%;
    width: 80px;
    height: 80px;
    margin-left: 14px;
    margin-top: 4px;
  }
  .login {
    display: block;
    color: #ffffff;
    margin-top: -47px;
    margin-left: 110px;
  }
  .zhuce {
    display: block;
    color: #ffffff;
    margin-top: -21px;
    margin-left: 154px;
  }
  .tup {
    width: 375px;
    height: 122;
  }
  .p {
    padding: 0;
    margin: 0;
    text-align: center;
    font-size: 13px;
  }
  .p_one {
    margin-bottom: 10px;
  }
  .div_credit_pay_one {
    border-top: 10px solid #f8f8f8;
  }
  .van_grid_ji {
    border-top: 10px solid #f8f8f8;
  }
  .div_credit_pay {
    color: #6a6b6b;
    font-size: 13px;
    .credit_pay {
      color: #b4b4b4;
      margin-right: 10px;
      font-size: 12px;
    }
  }
  .div_arrow {
    color: #b4b4b4;
    font-size: 13px;
    .arrow {
      margin-left: 5px;
      color: #b4b4b4;
    }
  }
  .like_img {
    width: 165px;
    height: 165px;
  }
  .like_p {
    font-size: 11px;
  }
  .like_jia {
    font-size: 12px;
    margin-left: -137px;
  }
  // .like_biao{
  //   margin: -40px;
  //   margin-left: 30px
  // }

  .huodong_img {
    width: 125px;
    height: 125px;
  }
  .h3 {
    text-align: center;
    font-weight: 100;
    font-size: 14px;
  }
  .van-image__img {
    border-radius: 50px;
  }
  .paid_p {
    padding: 0;
    margin: 0;
    color: #7d7e80;
    font-size: 12px;
    margin-top: 8px;
  }
  .paid_p_i {
    position: absolute;
    top: 10px;
    right: 16px;
    display: inline-block;
    background-color: #ff6f6f;
    border-radius: 50%;
    width: 16px;
    height: 17px;
    line-height: 17px;
    color: #fff;
    font-size: 12px;
    text-align: center;
  }
  .van-tabbar-item__text {
    position: relative;
    top: 0;
    left: 0;
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
  // overflow: hidden; /*超出部分隐藏*/
  // text-overflow: ellipsis; /* 超出部分显示省略号 */
  // white-space: nowrap; /*规定段落中的文本不进行换行 */
  // width: 150px; /*需要配合宽度来使用*/
}
</style>

