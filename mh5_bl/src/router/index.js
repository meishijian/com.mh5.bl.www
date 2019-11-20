import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [{
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
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;