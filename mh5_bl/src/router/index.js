import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Home
  },
  {
    path: "/class",
    component: () =>
      import("../views/Class.vue")
  },
  {
    path: "/me",
    component: () =>
      import("../views/Me.vue"),
  },
  {
    path: "/goodslist",
    component: () =>
      import("../views/GoodsList.vue")
  },
  {
    path: "/search",
    component: () =>
      import("../views/Search.vue")
  },
  {
    path: "/goodsDetail",
    component: () =>
      import("../views/GoodsDetail.vue")
  },
  {
    path: "/order",
    component: () =>
      import("../views/Order.vue"),
    meta: {
      judge: true
    }
  },
  {
    path: "/address",
    component: () =>
      import("../views/Address.vue")
  },
  {
    path: "/shopAddress",
    component: () =>
      import("../views/ShopAddress.vue")
  },
  {
    path: "/shopping",
    component: () =>
      import("../views/Shopping.vue")
  },
  // 搜索 进去 商品列表页面
  {
    path: "/goodsSearch",
    component: () =>
      import("../views/goodsSearch.vue"),
    meta: {
      judge: true
    }
  },
  // 登录 界面
  {
    path: "/login",
    component: () =>
      import("../views/Login.vue")
  },
  // 注册 界面
  {
    path: "/regist",
    component: () =>
      import("../views/Regist.vue")
  },
  // 我的 界面
  {
    path: "/myInfo",
    component: () =>
      import("../views/MyInfo.vue"),
    meta: {
      judge: true
    }
  },
  // 付款 界面
  {
    path: "/payment",
    component: () =>
      import("../views/Payment.vue"),
    meta: {
      judge: true
    }
  },
  // 订单 详细 界面
  {
    path: "/myorder/:numId",
    component: () =>
      import("../views/Myorder.vue"),
    meta: {
      judge: true
    }
  },
  // 确认订单 userNickname
  {
    path: "/orderSorry",
    component: () =>
      import("../views/OrderSorry.vue"),
    meta: {
      judge: true
    }
  },
  // 我的昵称 userNickname
  {
    path: "/userNickname",
    component: () =>
      import("../views/UserNickname.vue"),
    meta: {
      judge: true
    }
  },
];
// Shopping.vue

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach((to, from, next) => {

  if (to.meta !== undefined && to.meta.judge !== undefined && to.meta.judge) {
    let token = localStorage.getItem("token");
    if (token == null) {
      next("/login")
    } else {
      next()
    }
  } else {
    next();
  }
})

export default router;