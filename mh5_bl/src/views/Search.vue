<template>
  <div class="search">
    <van-nav-bar title="标题">
      <!-- 左边搜索栏 -->
      <div slot="left">
        <van-search placeholder="搜索热门商品" @search="onSearch" class="searchs" v-model="value"></van-search>
      </div>
      <div slot="right">
        <span class="quxiao" @click="searchs_qu">取消</span>
      </div>
    </van-nav-bar>
    <!-- 最近搜索 -->

    <!-- 热门搜索 -->
    <div class="remen">
      <p class="re">
        <van-icon name="star-o" class="star"></van-icon>热门搜索
      </p>
    </div>
    <!--搜索的 商品 -->
    <div class="shangping">
      <ul>
        <li v-for="(item, index) in shangpingData" :key="index" class="sp_li">{{item.sort_name}}</li>
      </ul>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      shangpingData: [],
      value: ""
    };
  },
  methods: {
    // 搜索
    onSearch() {
      // 把商品名称存起来
      localStorage.setItem("goods_name", this.value);
    },
    // 取消
    searchs_qu() {
      window.history.back(-1);
    },
    // 搜索的 商品
    shangping() {
      this.$http.get("/popular_search").then(res => {
        // console.log(res);
        this.shangpingData = res.data.data;
      });
    }
  },
  created() {
    this.shangping();
  }
};
</script>
<style lang="less" >
.searchs {
  width: 340px;
  position: relative;
  top: 4px;
  margin-left: -19px;
}
.quxiao {
  margin-left: 10px;
  margin-top: 10px;
  display: inline-block;
}
.remen {
  margin-left: -15px;
  margin-top: 100px;
}
.star {
  margin-top: 30px;
  margin-right: 5px;
}
.re {
  font-size: 13px;
  margin-left: 30px;
}

.sp_li {
  width: 87px;
  height: 26px;
  border: 1px solid #dbdbdb;
  display: inline-block;
  text-align: center;
  font-size: 13px;
  line-height: 26px;
  margin-top: 7px;
  margin-right: 3px;
  border-radius: 8px;
}
</style>