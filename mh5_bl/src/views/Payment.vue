<template>
  <div class="payment">
    <van-nav-bar left-arrow title="收银台" @click-left="onClickLeft" />
    <van-notice-bar
      color="#000"
      background="#feefb8"
      text="银联支付请至i百联APP使用"
      :scrollable="false"
      left-icon="volume-o"
      mode="closeable"
    />
    <van-row class="van_row">
      <van-col span="12" class="van_row_one">
        待支付：
        <span class="van_row_one_span">￥{{totalPrices}}</span>
      </van-col>
      <van-col span="12" class="van_row_two">订单金额：￥{{totalPrices}}</van-col>
    </van-row>

    <van-nav-bar class="bar" title="由百联集团旗下安付宝提供服务" />
    <!-- OK支付 -->
    <van-panel
      icon="https://res22.iblimg.com/rescashier-1/resources/v4.0/img/ok-icon-temp.png"
      title="OK支付"
      desc="由百联集团旗下安付宝提供"
    ></van-panel>
    <!-- 百联卡/OK积点卡 -->
    <van-panel
      icon="https://res22.iblimg.com/rescashier-1/resources/v3.0/css/i/ok-card.png"
      title="百联卡/OK积点卡"
      desc="百联集团旗下不记名预付卡"
    ></van-panel>
    <!-- OK会员卡 -->
    <van-panel
      icon="https://res22.iblimg.com/rescashier-1/resources/v3.0/css/i/vip-card.png"
      title="OK会员卡"
      desc="百联集团旗下记名预付卡"
    ></van-panel>

    <van-nav-bar class="bar" left-text="其他支付方式" />
    <!-- 微信 -->
    <van-panel
      icon="https://res22.iblimg.com/rescashier-1/resources/v3.0/css/i/weixin-card.png"
      title="微信"
      desc="微信安全支付"
      @click="show=true"
    ></van-panel>
    <van-overlay :show="show" @click="show = false">
      <div class="wrapper" @click.stop>
        <div class="block">
          <img class="img" src="http://127.0.0.1:9494/api/v1/public/image/weixin.jpg" alt />
          <van-nav-bar
            left-text="未支付"
            right-text="已支付"
            @click-left="onClickLeft"
            @click-right="onClickRight"
          />
        </div>
      </div>
    </van-overlay>
  </div>
</template>
<script>
export default {
  data() {
    return {
      totalPrices: localStorage.getItem("totalPrices"),
      show: false,
      orderId: this.$route.query.orderId
    };
  },
  methods: {
    onClickLeft() {
      this.$router.push("/shopping");
    },
    onClickRight() {
      // 请求 数据
      this.$http
        .put("/modify_order", {
          orderId: this.orderId
        })
        .then(res => {
          //   console.log(res);
          this.$router.push("/myorder/2");
        });
    }
  }
};
</script>

<style lang="less">
.payment {
  .van-notice-bar__content {
    font-size: 12px;
    margin-left: 73px;
  }
  .van-icon-cross {
    color: #9a8b6c;
  }
  .van_row {
    margin-top: 20px;
    padding: 0 20px;
    .van_row_one {
      font-size: 16px;
      .van_row_one_span {
        color: #ea2a39;
      }
    }
    .van_row_two {
      font-size: 12px;
      color: #736f6c;
    }
  }
  .van-icon__image {
    width: 2em;
    height: 3em;
    margin-right: 10px;
  }
  .bar {
    border-top: 10px solid #f2f2f2;
    background-color: #fbfbfb;
  }
  .van-nav-bar__title {
    font-size: 13px;
  }
  .van-nav-bar__text {
    color: #9e9e9e;
  }
}
.wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.block {
  width: 200px;
  height: 250px;
  background-color: #fff;
  .img {
    width: 200px;
  }
  .van-nav-bar__text {
    color: rgb(250, 103, 103);
    border: 1px solid #eaeaea;
    border-radius: 10px;
    padding: 0;
    margin: 0;
    height: 28px;
    line-height: 28px;
    font-size: 12px;
    background-color: rgb(193, 216, 144);
    width: 50px;
  }
}
</style>