<template>
  <div class="home">
    <!-- 导航栏 -->
    <van-nav-bar class="van-nav-bar">
      <!-- 左边分类 -->
      <div slot="left" class="fenl" @click="fenl">
        <van-icon class="fenimg" name="bars" color="#a8a8a8" size="18px"></van-icon>分类
      </div>
      <!-- 搜索框 -->
      <div slot="title">
        <van-search
          v-model="value"
          placeholder="搜索"
          shape="round"
          @search="onSearch"
          disabled="false"
          @click="goods_tiao"
        ></van-search>
      </div>
      <!-- 右边 -->
      <div slot="right">
        <van-icon
          class="shopping"
          name="shopping-cart-o"
          color="#838383"
          size="25px"
          @click="gouwuche"
        >
          <span
            class="paid_p_span"
            v-if="JSON.parse(infoData).length == 0"
          >{{JSON.parse(infoData).length}}</span>
        </van-icon>
        <van-icon @click="me" name="manager-o" color="#838383" size="25px" />
      </div>
    </van-nav-bar>

    <!-- <h1>首页</h1> -->
    <!-- 轮播图 -->
    <van-swipe :autoplay="3000" indicator-color="white" class="swipe">
      <van-swipe-item v-for="item in imageData" :key="item.id">
        <img class="swipe_img" :src="item.image" alt width="100%" />
      </van-swipe-item>
    </van-swipe>
    <!--分类区 -->
    <van-grid :gutter="4" :column-num="5" class="grid">
      <van-grid-item v-for="(item, index) in fenlData" :key="index" :icon="item.img" :text="item.p"></van-grid-item>
    </van-grid>
    <!-- 今日爆款 -->
    <van-cell value="内容" class="vancell">
      <img
        class="cellimg"
        src="https://img22.iblimg.com/market-2/images/activity/1089050602.png"
        alt
      />
      <span class="cells">
        查看更多
        <van-icon name="play" />
      </span>
    </van-cell>
    <!-- 今日爆款 滑动切块 -->
    <van-tabs swipeable class="explosive" color="transparent">
      <van-tab v-for="(item, index) in moneyData" :key="index">
        <div slot="title">
          <img :src="item.image" alt class="tabsimg" />
          <p class="tabs-p">{{item.p}}</p>
          <span class="tabs-span">{{item.span}}</span>
        </div>
      </van-tab>
    </van-tabs>
    <!-- 拼团 -->
    <van-cell value="内容" class="vancells">
      <img
        class="cellimgs"
        src="https://img23.iblimg.com/marketgif-1/images/activity/970427391.png"
        alt
      />
      <span class="cellss">
        查看更多
        <van-icon name="play" />
      </span>
    </van-cell>
    <!-- 拼团 滑动切块 -->
    <van-tabs swipeable color="transparent" class="pintuan">
      <van-tab v-for="(item, index) in assembleData" :key="index">
        <div slot="title" class="pintuans">
          <img :src="item.image" alt class="tabsimgs" />
          <p class="tabs-title">{{item.title}}</p>
          <span class="tabs-spans">{{item.span}}</span>
          <p class="tabs-pp">{{item.p}}</p>
          <div class="kaituan">去开团</div>
        </div>
      </van-tab>
    </van-tabs>
    <!-- 相见恨晚轮播图 -->
    <p class="xiang">相见恨晚.边看边买</p>
    <van-swipe :autoplay="3000" indicator-color="white" class="x-swipe">
      <van-swipe-item v-for="(item, index) in meetData" :key="index">
        <img class="xiang_swipe" :src="item.image" alt />
      </van-swipe-item>
    </van-swipe>
    <!-- <div class="x-img_three">
      <img class="x-img" src="https://img22.iblimg.com/market-3/images/activity/473598936.jpg" alt />
      <img class="x-imgs" src="https://img22.iblimg.com/market-3/images/activity/637010217.jpg" alt />
    </div> -->
    <!-- 精品推荐 -->
    <div class="jingping">
      <img class="jinpimg" src="https://img22.iblimg.com/market-2/images/activity/39653131.png" alt />
      <!-- 宫格 -->
      <div class="jingping_gouge">
        <van-grid square>
          <van-grid-item class="gouge" v-for="(item, index) in selectedData" :key="index" text="文字">
            <img class="gridimg" :src="item.image" alt />
            <p class="jingping_gouge_p">{{item.p}}</p>
            <span class="jingping_gouge_span">{{item.span}}</span>
          </van-grid-item>
        </van-grid>
      </div>
    </div>
    <!-- 好货排行榜 -->
    <p class="haohuo">好货排行榜</p>
    <van-tabs class="haohuo-tabs" swipeable color="transparent">
      <van-tab v-for="(item, index) in qualityData" :key="index">
        <div slot="title">
          <img class="haohuo_img" :src="item.sort_image" alt />
          <p class="haohuo_p">{{item.sort_name}}</p>
        </div>
      </van-tab>
    </van-tabs>

    <!-- 品牌排行榜 -->
    <van-tabs class="bra-tabs" swipeable color="transparent">
      <van-tab v-for="(item, index) in brandData" :key="index">
        <div slot="title" class="brand">
          <img class="bra_img" :src="item.bra_image" alt />
          <p class="bra_p">{{item.bra_name}}</p>
        </div>
      </van-tab>
    </van-tabs>
    <!-- // 下單即享 -->
    <!-- <img class="xiadan" src="../assets/Snipaste_2019-11-19_08-59-53.png" alt /> -->
    <!-- 精选活动 -->
    <p class="selected">精选活动</p>
    <img
      class="selected_img"
      src="https://img23.iblimg.com/market-3/images/activity/238953964.jpg"
      alt
    />
    <!-- 切换滑动 -->
    <!-- 宫格 -->
    <van-tabs class="huodong" swipeable color="transparent">
      <van-tab v-for="(item, index) in activityData" :key="index">
        <div slot="title">
          <img class="huodong_img" :src="item.img" alt />
        </div>
      </van-tab>
    </van-tabs>
    <!-- 猜你喜欢 -->
    <h3>猜你喜欢</h3>
    <!-- list 列表 -->
    <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
      <!-- 宫格 -->
      <van-grid :column-num="2">
        <van-grid-item v-for="(item, index) in likeData" :key="index" @click="like_shop(item.id)">
          <img class="like_img" :src="item.image" alt />
          <!-- <van-tag plain class="like_biao">看相似</van-tag> -->
          <p class="like_p">{{item.goods_name }}</p>
          <p class="like_jia">￥{{item.price}}</p>
        </van-grid-item>
      </van-grid>
    </van-list>
    <vueToTop class="totop_i" type="5" right="30" bottom="70" size="22" top="1000"></vueToTop>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  data() {
    return {
      value: "",
      //轮播图数据
      imageData: [],
      // 分类区的数据吧死数据
      fenlData: [
        {
          id: 1,
          img:
            "https://img23.iblimg.com/market-2/images/activity/431458669.png",
          p: "八佰伴"
        },
        {
          id: 2,
          img:
            "https://img22.iblimg.com/market-2/images/activity/195362033.png",
          p: "闪购"
        },
        {
          id: 3,
          img:
            "https://img22.iblimg.com/market-2/images/activity/1669004729.png",
          p: "到家"
        },
        {
          id: 4,
          img: "https://img22.iblimg.com/market-2/images/activity/55730966.png",
          p: "品牌团"
        },
        {
          id: 5,
          img:
            "https://img22.iblimg.com/market-2/images/activity/1752633857.png",
          p: "篮筐"
        },
        {
          id: 6,
          img:
            "https://img23.iblimg.com/market-2/images/activity/1647131699.png",
          p: "全球购"
        },
        {
          id: 7,
          img:
            "https://img23.iblimg.com/market-2/images/activity/666204858.png",
          p: "百联卡"
        },
        {
          id: 8,
          img:
            "https://img23.iblimg.com/market-2/images/activity/2019575694.png",
          p: "领劵"
        },
        {
          id: 9,
          img:
            "https://img22.iblimg.com/market-2/images/activity/1268963070.png",
          p: "充值"
        },
        {
          id: 10,
          img:
            "https://img23.iblimg.com/market-2/images/activity/190234359.png",
          p: "停车"
        }
      ],
      // 今日爆款 死数据
      moneyData: [
        {
          id: 1,
          image: "https://Img.iblimg.com/photo-42/3030/2105850222_200x200.jpg",
          p: "￥45",
          span: "参考价￥65"
        },
        {
          id: 2,
          image:
            "https://img19.iblimg.com/mp-175/mp/goods/1767512715_200x200.jpg",
          p: "￥13",
          span: "参考价￥13"
        },
        {
          id: 3,
          image: "https://Img.iblimg.com/photo-42/3060/1152794105_200x200.jpg",
          p: "￥17.5",
          span: "参考价￥22.9"
        },
        {
          id: 4,
          image: "https://Img.iblimg.com/photo-45/3020/1901664192_200x200.jpeg",
          p: "￥199",
          span: "参考价￥399"
        },
        {
          id: 5,
          image:
            "https://img17.iblimg.com/mp-175/mp/goods/456475406_200x200.jpg",
          p: "￥105",
          span: "参考价￥65"
        },
        {
          id: 6,
          image: "https://Img.iblimg.com/photo-45/3030/1788921977_200x200.jpg",
          p: "￥9.9",
          span: "参考价￥39"
        },
        {
          id: 7,
          image: "https://Img.iblimg.com/photo-42/3020/609174818_200x200.jpg",
          p: "￥1299",
          span: "参考价￥1799"
        },
        {
          id: 8,
          image: "https://Img.iblimg.com/photo-44/3020/1611420488_200x200.jpg",
          p: "￥99",
          span: "参考价￥699"
        },
        {
          id: 9,
          image:
            "https://Img33.iblimg.com/goods-16/3030/2016/10/SP_3030_303001506723_01_10006.jpg",
          p: "￥38",
          span: "参考价￥38"
        },
        {
          id: 10,
          image: "https://Img.iblimg.com/photo-42/3020/467380432_200x200.jpg",
          p: "￥99",
          span: "参考价￥128"
        },
        {
          id: 11,
          image: "https://Img.iblimg.com/photo-45/3020/2007830833_200x200.jpeg",
          p: "￥30.9",
          span: "参考价￥59.8"
        },
        {
          id: 12,
          image: "https://Img.iblimg.com/photo-42/3030/957109114_200x200.jpg",
          p: "￥241",
          span: "参考价￥389"
        },
        {
          id: 13,
          image: "https://Img.iblimg.com/photo-46/1000/1103762204_200x200.jpg",
          p: "￥19.8",
          span: "参考价￥19.8"
        },
        {
          id: 14,
          image: "https://Img.iblimg.com/photo-42/3020/208623902_200x200.jpeg",
          p: "￥399",
          span: "600"
        }
      ],
      // 拼团数据 死数据
      assembleData: [
        {
          id: 1,
          image:
            "https://img19.iblimg.com/mp-175/mp/goods/161244020_800x800.jpg",
          title: "壹食壹品 壹食壹品...",
          span: "2人团 | ￥49.80",
          p: "单买￥59.00"
        },
        {
          id: 2,
          image:
            "https://img20.iblimg.com/mp-176/mp/goods/1358765487_800x800.jpg",
          title: "Blackmores 澳佳...",
          span: "2人团 | ￥69.00",
          p: "单买￥115.00"
        },
        {
          id: 3,
          image:
            "https://img20.iblimg.com/mp-178/mp/goods/1864527459_800x800.jpg",
          title: "LANCOME 兰蔻...",
          span: "2人团 | ￥279.00",
          p: "单买￥329.00"
        },

        {
          id: 4,
          image:
            "https://img20.iblimg.com/mp-175/mp/goods/410971919_800x800.jpg",
          title: "飞利浦 (PHILIPS)...",
          span: "2人团 | ￥199.00",
          p: "单买￥399.00"
        },
        {
          id: 5,
          image:
            "https://img18.iblimg.com/mp-175/mp/goods/566506431_800x800.jpg",
          title: "THE BODY SHOP...",
          span: "2人团 | ￥70.00",
          p: "单买￥80.00"
        },
        {
          id: 6,
          image:
            "https://img17.iblimg.com/mp-176/mp/goods/770313627_800x800.jpg",
          title: "FANCL 芳珂 无添...",
          span: "2人团 | ￥169.00",
          p: "单买 ￥107.00"
        }
      ],
      // 精选推荐 死数据
      selectedData: [
        {
          id: 1,
          image:
            "https://img13.iblimg.com/goods-132/2000/2017/02/SP_2000_20000265151001_01_10009.jpg",
          p: "囤货小当家",
          span: "会囤货会生活"
        },
        {
          id: 2,
          image:
            "https://img20.iblimg.com/mp-175/mp/goods/37098407_220x220.jpg",
          p: "水润护肤",
          span: "为您推荐"
        },
        {
          id: 3,
          image: "https://Img.iblimg.com/photo-32/2000/988168636_220x220.jpg",
          p: "薯动全城",
          span: "为您推荐"
        },
        {
          id: 4,
          image:
            "https://img16.iblimg.com/mp-175/mp/goods/1465456123_220x220.jpg",
          p: "缤纷彩妆",
          span: "缤纷彩妆"
        },
        {
          id: 5,
          image: "https://Img33.iblimg.com/photo-3/3030/1048889630_220x220.jpg",
          p: "美味下午茶",
          span: "不负午后时光"
        },
        {
          id: 6,
          image: "https://Img.iblimg.com/photo-42//1739704413_220x220.jpg",
          p: "姨妈小驻",
          span: "呵护那几天"
        },
        {
          id: 7,
          image:
            "https://Img34.iblimg.com/goods-26/2000/2016/11/SP_2000_20000849831001_01_10009.jpg",
          p: "速冻美味",
          span: "为你推荐"
        },
        {
          id: 8,
          image: "https://Img.iblimg.com/photo-42//872861721_220x220.jpg",
          p: "衣物洗护",
          span: "为你推荐"
        }
      ],
      // 好货排行榜
      qualityData: [],
      // 品牌排行
      brandData: [],
      // 精选活动数据
      activityData: [
        {
          id: 1,
          img:
            "https://img22.iblimg.com/market-3/images/activity/1258469836.jpg"
        },
        {
          id: 2,
          img: "https://img22.iblimg.com/market-3/images/activity/369569308.jpg"
        },
        {
          id: 3,
          img: "https://img22.iblimg.com/market-3/images/activity/755948825.jpg"
        },
        {
          id: 4,
          img: "https://img23.iblimg.com/market-3/images/activity/551841080.jpg"
        },
        {
          id: 4,
          img:
            "https://img22.iblimg.com/market-3/images/activity/1258469836.jpg"
        }
      ],
      // 彩泥喜欢数据
      likeData: [],
      //相见恨晚轮播图
      meetData: [],
      loading: false,
      finished: false
    };
  },
  methods: {
    ...mapMutations(["getInfoData"]),
    onSearch() {},
    // 跳转购物车页面
    gouwuche() {
      this.$router.push("/shopping");
    },
    // 搜索跳转
    goods_tiao() {
      this.$router.push("/search");
    },
    // 点击分类跳转页面
    fenl() {
      this.$router.push("/class");
    },
    // 点击跳转个人中心页面
    me() {
      this.$router.push("/me");
    },
    //轮播图
    imageList() {
      this.$http.get("main_ad_images").then(res => {
        // console.log(res);
        this.imageData = res.data.data;
        // console.log(this.imageList);
      });
    },
    // 相见恨晚轮播图
    meetList() {
      this.$http.get("/main_small_images").then(res => {
        // console.log(res);
        this.meetData = res.data.data;
        // console.log(this.meetData);
      });
    },
    // 好货排行榜
    qualityList() {
      this.$http.get("/main_goods_ranking").then(res => {
        // console.log(res);
        this.qualityData = res.data.data;
        // console.log(this.qualityData);
      });
    },
    // 品牌排行
    brandList() {
      this.$http.get("/main_brand_ranking").then(res => {
        // console.log(res);
        this.brandData = res.data.data;
        // console.log(this.qualityData);
      });
    },
    // 猜你喜欢数据
    likeList() {
      // this.$http.get("/guess").then(res => {
      //   console.log(res);
      //   // this.likeData = res.data.data;
      //   // console.log(this.qualityData);
      //   this.likeData.push(...res.data.data);
      // });
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
    }
  },
  created() {
    this.imageList();
    this.meetList();
    this.qualityList();
    this.brandList();
    this.likeList();

    // this.getInfoData(JSON.parse(localStorage.getItem("goods_id")).length);
  },
  computed: {
    // 隱射
    ...mapState(["infoData"])
  }
};
</script>

<style lang="less">
.home {
  .totop_i {
    color: #fff;
    border-radius: 50%;
    background-color: #adadad;
    border: 10px solid #adadad;
  }
  .fenl {
    width: 67px;
    height: 33px;
    border-radius: 19px;
    background-color: #e5e5e5;
    line-height: 33px;
    color: #838383;
  }
  .fenimg {
    //  top: -px
    left: -3px;
  }
  .shopping {
    left: -10px;
  }
  .swipe {
    top: 10px;
  }
  .swipe_img {
    // width: 375px;
    width: 100%;
    height: 200px;
  }
  .grid {
    margin-top: 20px;
  }
  .cellimg {
    width: 170px;
    height: 16px;
    margin-left: 15px;
  }
  .vancell {
    top: 10px;
  }

  .cells {
    color: #9c9d9f;
    font-size: 12px;
    margin-left: 90px;
    position: relative;
    top: -6px;
  }
  .tabsimg {
    width: 90px;
    height: 90px;
  }
  .tabs-p {
    margin-top: -20px;
  }
  .tabs-span {
    margin-top: -30px;
    font-size: 13px;
    color: #afafaf;
  }
  .cellimgs {
    width: 123px;
    height: 17px;
  }

  .cellss {
    color: #9c9d9f;
    font-size: 12px;
    margin-left: 152px;
    position: relative;
    top: -6px;
  }
  .vancells {
    margin-top: 30px;
    border-top: 9px solid #f9f9f9;
    border-bottom: 9px solid #f9f9f9;
  }

  .tabs-title {
    margin-top: -80px;
  }
  .tabs-span {
    color: #9c9d9f;
    font-size: 11px;
  }
  .pintuans {
    margin-top: -12px;
    border: 9px solid #f9f9f9;
  }
  .tabsimgs {
    width: 90px;
    height: 90px;
    margin-left: -168px;
  }
  .tabs-title {
    margin-left: 44px;
    margin-top: -105px;
    font-size: 9px;
  }
  .tabs-spans {
    font-size: 9px;
    color: red;
    margin-left: 25px;
    margin-top: -38px;
  }

  .tabs-pp {
    font-size: 9px;
    margin-left: 12px;
    margin-top: -22px;
    color: #9a9a9a;
  }
  .kaituan {
    width: 54px;
    height: 20px;
    background-color: #ff4a4a;
    color: #f9f9f9;
    border-radius: 10px;
    line-height: 20px;
    font-size: 12px;
    margin-left: 86px;
    margin-top: -13px;
  }
  .xiang {
    text-align: center;
  }
  .xiang_swipe {
    // width: 375px;
    width: 100%;
    height: 180px;
  }
  .x-swipe {
    border: 10px solid #ffffff;
    margin-top: -15px;
  }

  .x-img {
    width: 225px;
    height: 127px;
    /* border: 6px solid #ffffff; */
    margin-left: 10px;
    /* margin-top: 18px; */
    position: relative;
    top: -17px;
  }
  .x-imgs {
    width: 124px;
    height: 127px;
    border: 6px solid #ffffff;
    position: relative;
    top: -11px;
  }
  .jingping {
    background-color: #ffecec;
  }
  .jingping .jinpimg {
    // width: 375px;
    height: 45px;
  }
  .jingping_gouge {
    // width: 375px;
    width: 100%;
    height: 300px;
    // border:6px solid #ffecec
  }
  .gridimg {
    width: 80px;
    height: 74px;
    border-radius: 2px;
  }
  .jingping_gouge_p {
    font-size: 14px;
    color: #f9f9f9;
    margin-top: 1px;
  }
  .jingping_gouge_span {
    font-size: 11px;
    color: #f9f9f9;
    margin-top: -10px;
  }
  .gouge {
    padding-top: 37% !important;
  }
  .haohuo {
    margin-top: 0px;
    text-align: center;
    background-color: #f8f8f8;
    height: 43px;
    line-height: 43px;
  }
  .haohuo_img {
    width: 90px;
    height: 90px;
  }
  .haohuo_p {
    font-size: 14px;
    margin-top: -24px;
  }
  .haohuo-tabs {
    margin-top: -17px;
    border: 10px solid #f8f8f8;
  }
  .bra-tabs {
    margin-top: -17px;
    border: 10px solid #f8f8f8;
  }

  .bra_img {
    width: 90px;
    height: 90px;
  }
  .bra_p {
    font-size: 14px;
    margin-top: -24px;
  }
  .xiadan {
    // margin: 0 auto;
    width: 100%;
    border: 6px solid #f8f8f8;
  }
  .selected {
    text-align: center;
  }
  .selected_img {
    // width: 359px;
    width: 100%;
    height: 160px;
    border-bottom: 8px solid #f8f8f8;
    border-left: 8px solid #f8f8f8;
    border-right: 8px solid #f8f8f8;
  }
  .activity_grid {
    width: 125px;
    height: 125px;
  }
  .like_img {
    width: 165px;
    height: 165px;
  }
  .like_p {
    font-size: 11px;
    overflow: hidden; /*超出部分隐藏*/
    text-overflow: ellipsis; /* 超出部分显示省略号 */
    white-space: nowrap; /*规定段落中的文本不进行换行 */
    width: 150px; /*需要配合宽度来使用*/
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
  h3 {
    text-align: center;
  }
  .paid_p_span {
    position: absolute;
    top: -5px;
    right: -6px;
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
}
</style>