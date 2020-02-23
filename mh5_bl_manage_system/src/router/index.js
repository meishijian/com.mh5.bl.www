import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";


const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: Home,
    children: [
      // 分类目录
      {
        path: "/class",
        component: () =>
          import("../components/Class.vue")
      },
      // 轮播
      {
        path: "/swipe",
        component: () =>
          import("../components/Swipe.vue")
      },
      // 商品列表
      {
        path: "/goodslist",
        component: () =>
          import("../components/Goodslist.vue")
      },
      {
        // 商品列表  添加
        path: '/goodslist/add',
        component: () => import("../components/Goods_add.vue"),
      },
      {
        // 商品列表  编辑
        path: '/goodslist/edit/:id',
        component: () => import("../components/Goods_edit.vue"),
      }
    ]
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
