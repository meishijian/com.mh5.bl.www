<template>
  <div class="goods">
    <!-- 导航栏 -->
    <van-nav-bar left-arrow @click-left="onClickLeft">
      <!-- 左边搜索栏 -->
      <div slot="title" class="goods_div">
        <van-search class="search" placeholder="搜索你想要的商品" disabled="false" @click="goods_tiao"/>
      </div>
      <!-- 右边 -->
      <div slot="right">
        <van-icon v-if="icon_pd" color="#8d8d8d" name="qr" size="26px" @click="icon_pd =! icon_pd" />
        <van-icon v-else color="#8d8d8d" name="apps-o" size="26px" @click="icon_pd =! icon_pd" />
      </div>
    </van-nav-bar>
    <!-- 综合 -->
    <van-row>
      <van-col span="2" class="rowa">
        <!-- <van-dropdown-menu>
          <van-dropdown-item v-model="value1" :options="option1" />
        </van-dropdown-menu>-->
      </van-col>
      <!-- <van-col span="4" class="row active" @click="xiaoliang">销量</van-col> -->
      <van-col span="5" class="row" @click="xiaoliang">销量</van-col>
      <van-col span="5" class="row" @click="xiaoliang">价格</van-col>
      <van-col span="4" class="row">筛选</van-col>
    </van-row>

    <!-- 商品  两种状态-->
    <van-grid :column-num="1" v-if="icon_pd">
      <van-grid-item v-for="(item, index) in commodityData" :key="index" class="one_girs">
        <van-row gutter="24">
          <van-col span="8">
            <img class="one_img" :src="item.image" alt />
          </van-col>
          <van-col span="15">
            <p class="one_name">{{item.goods_name}}</p>
            <p class="one_service">「{{item.service}}」</p>
            <p class="one_price">￥{{item.price}}</p>
          </van-col>
        </van-row>
      </van-grid-item>
    </van-grid>

    <van-grid :column-num="2" v-else>
      <van-grid-item v-for="(item, index) in commodityData" :key="index" class="two_gird">
        <img class="two_img" :src="item.image" alt />
        <p class="two_name">
          <span class="two_service">「{{item.service}}」</span>
          {{item.goods_name}}
        </p>

        <p class="two_price">￥{{item.price}}</p>
      </van-grid-item>
    </van-grid>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 商品数据
      commodityData: [],
      icon_pd: true,
      value1: 0,

      option1: [
        { text: "综合排序", value: 0 },
        { text: "新品优先", value: 1 },
        { text: "评论数从高到低", value: 2 }
      ],
      // 销量判断
      volume_pd: false,
      // 价格判断
      jiage_pd: false
    };
  },
  methods: {
    onClickLeft() {
      this.$router.push("/class");
    },
    goods_tiao(){
      this.$router.push("/search")
    },

    // 商品
    commodityList() {
      // 获取商品id
      let id = localStorage.getItem("id");
      // console.log(id);

      this.$http
        .get("/goods_list", {
          params: { id: id }
        })
        .then(res => {
          // console.log(res);
          this.commodityData = res.data.data;
        });
    },

    // 销量排序
    xiaoliang() {
      let id = [];
      let volume = "";

      this.commodityData.forEach(item => {
        // console.log(element);
        id.push(item.id);
      });
      // console.log(id);
      // 点击 取反 true与false
      this.volume_pd = !this.volume_pd;
      this.jiage_pd = !this.jiage_pd;

      // 判断销量
      if (this.volume_pd == true) {
        volume = 1;
      } else {
        volume = 0;
      }

      // 判断价格
      if (this.jiage_pd == true) {
        volume = 3;
      } else {
        volume = 2;
      }

      this.$http
        .post("/goods_sort", {
          id: id,
          volume: volume
        })
        .then(res => {
          // console.log(res);
          this.commodityData = res.data.data;
        });
    }
  },

  created() {
    this.commodityList();
    // this.xiaoliang();
  }
};
</script>
<style lang="less">
.goods {
  .search {
    width: 290px;
    position: relative;
    top: -5px;
  }
  .two_img {
    width: 90px;
    height: 90px;
  }

  .two_gird {
    border: 3px solid #f8f8f8;
    margin-top: 10px;
  }
  .two_name {
    font-size: 12px;
    line-height: 19px;
  }
  .two_service {
    color: #ff4a4e;
    font-size: 12px;
  }
  .two_price {
    color: #ff4a4e;
    font-size: 12px;
    margin-left: -127px;
    margin-top: -2px;
  }

  .one_name {
    font-size: 12px;
    // margin-top: -81px;
    line-height: 19px;
  }
  .one_service {
    color: #ff4a4e;
    font-size: 12px;
  }
  .one_price {
    color: #ff4a4e;
    font-size: 12px;
  }
  .one_img {
    width: 100%;
    height: 100%;
  }
  .row {
    margin: 13px 15px;
    font-size: 15px;
    font-family: "Microsoft YaHei";
  }
  .one_girs {
    border-bottom: 1px solid #e7e7e7;
  }
  .active {
    color: red;
  }
}
</style>