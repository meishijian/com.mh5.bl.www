<template>
  <div class="myinfo">
    <!-- 顶部导航  左边 -->
    <van-nav-bar left-arrow title="设置" @click-left="onClickLeft" class="left_shop">
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
    <!-- 头像 -->
    <van-nav-bar class="div_credit_pay_one div_credit_pay_xiu">
      <div slot="left" class="div_credit_pay">头像</div>
      <div slot="right" class="div_arrow">
        <van-uploader
          class="pink_imgs pink_img"
          v-model="fileList"
          :deletable="false"
          :after-read="afterRead"
          multiple
          :max-count="1"
        />
      </div>
    </van-nav-bar>

    <!-- 昵称 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">昵称</div>
      <div slot="right" class="div_arrow" @click="userNickname">
        {{userData.nickname}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 性别 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">性别</div>
      <div slot="right" class="div_arrow" @click="sexPopup=!sexPopup">
        {{userData.sex}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>
    <van-popup v-model="sexPopup" position="bottom" :style="{ height: '22.5%' }">
      <van-button type="default" size="large" @click="userSex(1)">男</van-button>
      <van-button type="default" size="large" @click="userSex(2)">女</van-button>
      <van-button type="default" size="large" @click="userSex(0)">保密</van-button>
    </van-popup>
    <!-- 出生日期 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">出生日期</div>
      <div slot="right" class="div_arrow" @click="birthPopup=!birthPopup">
        {{userData.birth}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>
    <van-popup v-model="birthPopup" position="bottom" :style="{ height: '50%' }">
      <van-datetime-picker
        v-model="currentDate"
        type="date"
        :min-date="minDate"
        @confirm="confirm"
      />
    </van-popup>
    <!-- 偏好 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">偏好</div>
      <div slot="right" class="div_arrow" @click="preferencePopup=!preferencePopup">
        {{userData.preference}}
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>
    <van-popup v-model="preferencePopup" position="bottom" :style="{ height: '70%' }">
      <van-button
        v-for="(item, index) in goodsDate"
        :key="index"
        type="default"
        size="large"
        @click="userPre(item.id)"
      >{{item.cla_name}}</van-button>
      <div style="position: relative;">
        <van-button type="default" size="normal" @click="defaultDetermine">取消</van-button>
        <van-button type="primary" size="normal" class="primary" @click="primaryDetermine">确定</van-button>
      </div>
    </van-popup>
    <!-- 地址管理 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">地址管理</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 我的车牌 -->
    <van-nav-bar class="div_credit_pay_one div_credit_pay_border">
      <div slot="left" class="div_credit_pay">我的车牌</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 安全中心 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">安全中心</div>
      <div slot="right" class="div_arrow">
        修改登录密码、支付密码等
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 发票抬头管理 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">发票抬头管理</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 增票资质 -->
    <van-nav-bar class="div_credit_pay_one">
      <div slot="left" class="div_credit_pay">增票资质</div>
      <div slot="right" class="div_arrow">
        <van-icon name="play" class="arrow" />
      </div>
    </van-nav-bar>

    <!-- 退出 -->
    <van-button type="danger" size="large" @click="userOut">退出当前账号</van-button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 定义icon 本身为显示 true
      icon: false,
      // 头像
      fileList: [],
      userData: {},
      // 性别
      sexPopup: false,
      // 出生日期
      birthPopup: false,
      currentDate: new Date(),
      minDate: new Date(1947, 0, 1),
      // 偏好
      preferencePopup: false,
      // 偏好 商品分类
      goodsDate: [],
      // 存放 偏好
      preData: []
    };
  },
  methods: {
    //   导航左边按钮点击 返回上一页
    onClickLeft() {
      // console.log(111);
      // window.history.back(-1);
      this.$router.push("/me");
    },
    // 用户信息
    getUserData() {
      this.$http.get("/user_display_all").then(res => {
        // console.log(res);
        this.userData = res.data.data;
      });
    },
    // 退出
    userOut() {
      localStorage.clear();
      this.$router.push("/me");
    },
    // 上传头像
    afterRead(params) {
      // console.log(params.file)
      let formdate = new FormData();
      formdate.append("pic", params.file);
      let config = {
        headers: {
          "Content-Type": "multipart/form-data"
        }
      };
      this.$http.post("/user_pic_upload", formdate, config).then(res => {
        // console.log(res);
        this.$toast.success("上传头像成功!");
      });
    },
    // 跳转到 我的昵称
    userNickname() {
      this.$router.push("/userNickname");
    },
    // 修改 性别
    userSex(sex) {
      this.$http
        .put("/user_modify_sex", {
          sex: sex
        })
        .then(res => {
          this.$toast.success(res.data.message);
          this.sexPopup = false;
          // 渲染 用户信息
          this.getUserData();
        });
    },
    // 修改 出生日期
    confirm(value) {
      const data = new Date(value);
      // 年
      const y = data.getFullYear();
      // 月
      const m = (data.getMonth() + 1).toLocaleString().padStart(2, "0");
      // 日
      const d = data
        .getDate()
        .toLocaleString()
        .padStart(2, "0");
      let birth = `${y}-${m}-${d}`;
      this.$http
        .put("/user_modify_birth", {
          birth: birth
        })
        .then(res => {
          this.$toast.success(res.data.message);
          this.birthPopup = false;
          // 渲染 用户信息
          this.getUserData();
        });
    },
    // 获取 分类 左侧菜单
    getPreferencePopup() {
      this.$http.get("/goods_left_side").then(res => {
        // console.log(res);
        this.goodsDate = res.data.data;
      });
    },
    // 修改 偏好 数据
    userPre(pre) {
      // console.log(pre);
      this.preData.push(pre);
    },
    // 修改 偏好
    primaryDetermine() {
      this.$http
        .put("/user_modify_pre", {
          claId: this.preData.join(",")
        })
        .then(res => {
          this.$toast.success(res.data.message);
          this.preferencePopup = false;
          // 渲染 用户信息
          this.getUserData();
          this.preData = [];
        });
    },
    // 取消 修改 偏好
    defaultDetermine() {
      this.preferencePopup = false;
      this.preData = [];
    }
  },
  created() {
    // 渲染 用户信息
    this.getUserData();
    // 渲染 获取 分类 左侧菜单
    this.getPreferencePopup();
  }
};
</script>

<style lang="less">
.myinfo {
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
  .div_credit_pay_xiu {
    height: 85px;
    line-height: 85px;
  }
  .div_arrow {
    color: #b4b4b4;
    font-size: 13px;
    .arrow {
      margin-left: 5px;
      color: #b4b4b4;
    }
  }
  .div_credit_pay_border {
    border-top: 15px solid #f8f8f8;
  }
  .pink_imgs {
    border-radius: 50%;
    width: 80px;
    height: 80px;
    position: relative;
    top: 7px;
  }

  .van-image__img {
    display: block;
    width: 100%;
    height: 100%;
    position: relative;
    top: 28px;
    border-radius: 50%;
  }
  .primary {
    position: absolute;
    right: 0;
  }
}
</style>