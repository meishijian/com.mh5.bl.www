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
    path: "/login",
    component: () =>
      import("../views/Login.vue")
  },
  {
    path: "/regist",
    component: () =>
      import("../views/Regist.vue")
  }
];


const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

// 路由导航守卫
router.beforeEach((to, form, next) => {
  // 2、 进入login网页 但是没给login放行
  if (to.path === "/login") return next();
  if (to.path === "/regist") return next();
  // 1、 访问其他页面的时候 没有token的话就无法访问其他网页
  const tokenStr = window.sessionStorage.getItem("token");
  if (!tokenStr) return next("/login");
  // 3、访问其他网页时，也必须放行
  next();
});



export default router;
