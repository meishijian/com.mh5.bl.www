<template>
  <div class="goods">
    <!-- 导航栏 -->
    <van-nav-bar left-arrow @click-left="onClickLeft">
      <!-- 左边搜索栏 -->
      <div slot="title" class="goods_div">
        <van-search class="search" placeholder="搜索你想要的商品" disabled="false" @click="goods_tiao" />
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
          <van-col span="8" @click="list_detail(item.id)">
            <img class="one_img" :src="item.image" alt />
          </van-col>
          <van-col span="15">
            <p class="one_name" @click="list_detail(item.id)">{{item.goods_name.slice(0,16)}}</p>
            <p class="one_service" @click="list_detail(item.id)">{{item.service}}</p>
            <p class="one_price" @click="list_detail(item.id)">￥{{item.price}}</p>
            <i class="guowu" @click="addShop(item.id)">
              <van-icon name="shopping-cart-o" color="#ff9f9f" size="20px" class="guowu_img" />
            </i>
          </van-col>
        </van-row>
      </van-grid-item>
    </van-grid>

    <van-grid :column-num="2" v-else>
      <van-grid-item
        v-for="(item, index) in commodityData"
        :key="index"
        class="two_gird"
        @click="list_detail(item.id)"
      >
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
    // 左边箭头返回
    onClickLeft() {
      window.history.back(-1);
    },

    // 搜索跳转
    goods_tiao() {
      this.$router.push("/search");
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
    },

    //点击每一件商品的id 都存起来
    list_detail(id) {
      localStorage.setItem("list_id", id);
      this.$router.push("/goodsDetail");
    },
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
          count: 1
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
            count: 1
          };
        } else {
          // 数量加加
          cart[id].count++;
        }
      }
      // 最后把 cart 添加到浏览器 字符串形式
      localStorage.setItem("cart", JSON.stringify(cart));
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
  .guowu {
    width: 30px;
    height: 30px;
    border: 1px solid #e7e7e7;
    border-radius: 17px;
    display: inline-block;
    margin-top: -35px;
    margin-left: 181px;
  }
  .guowu_img {
    margin-left: 4px;
    margin-top: 5px;
  }
}
</style>