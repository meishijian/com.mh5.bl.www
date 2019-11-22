<template>
  <div class="address">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="新建收货地址" @click-left="onClickLeft" class="left_shop">
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

    <!-- 收货地编辑-->
    <van-address-edit
      :area-list="areaList"
      show-set-default
      show-search-result
      :address-info="addressInfo"
      :search-result="searchResult"
      :area-columns-placeholder="['请选择', '请选择', '请选择']"
      @change-detail="onChangeDetail"
      @save="addAddress"
    />
  </div>
</template>
<script>
import address from "./address.js";
export default {
  data() {
    return {
      icon: false,
      //   添加收货地址数据
      addressInfo: {
        name: "",
        tel: "",
        province: "",
        city: "",
        county: "",
        addressDetail: "",
        isDefault: false
      },
      searchResult: [],
      areaValue: "440105",
      areaList: address
    };
  },
  methods: {
    //   返回上一页
    onClickLeft() {
      window.history.back(-1);
    },

    // 点击保存按钮 添加地址
    addAddress(content) {
      // console.log(content);
      this.$http
        .post("/received_address", {
          shr_name: content.name,
          mobile: content.tel,
          province: content.province,
          city: content.city,
          area: content.county,
          address: content.addressDetail,
          isDefault: content.isDefault
        })
        .then(res => {
          // console.log(res);
          // 成功提示
          // this.$toast("提示文案");
          this.$toast.success("添加收货地址成功");
          // 返回上一个页面
          this.$router.push("/address");
        });
    },

    onChangeDetail(val) {
      if (val) {
        this.searchResult = [
          {
            name: "黄龙万科中心",
            address: "杭州市西湖区"
          }
        ];
      } else {
        this.searchResult = [];
      }
    }
  },
  created() {}
};
</script>

<style lang="less">
.address {
  .dahang_tabbar {
    background-color: pink;
    height: 60px;
    // color: red
  }
}
</style>