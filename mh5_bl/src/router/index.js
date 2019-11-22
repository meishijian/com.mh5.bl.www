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
      import("../views/Me.vue")
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
    path: "/shopping",
    component: () =>
      import("../views/Shopping.vue")
  },
  // 搜索 进去 商品列表页面
  {
    path: "/goodsSearch",
    component: () =>
      import("../views/goodsSearch.vue")
  },
  // 登录 界面
  {
    path: "/login",
    component: () =>
      import("../views/Login.vue")
  },
];
// Shopping.vue

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;