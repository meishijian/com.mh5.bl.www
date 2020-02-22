import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(ElementUI);

import { main_host } from './config.js'

import axios from 'axios';
// 配置axios请求的地址
axios.defaults.baseURL = main_host;

// 设置全局配置 axios 的 request 拦截器 就是设置头  需要授权的 API ，必须在请求头中使用 `Authorization` 字段提供 `token` 令牌
axios.interceptors.request.use(config => {
  // console.log(config);
  // 通过拦截器 request 请求 ，主动设置请求头，追加新属性 为Authorization ,让他的值 等于token
  config.headers.Authorization = window.sessionStorage.getItem("token");
  // 返回值
  return config;
});

Vue.prototype.$http = axios;


import "./assets/css/index.css";

// 第三方 使用table
import TreeTable from "vue-table-with-tree-grid";
// 全局注册 树形表格
Vue.component("TreeTable", TreeTable);

// 全局 过滤器
Vue.filter("dateFormat", originVal => {
  const data = new Date(originVal * 1000);
  // 年
  const y = data.getFullYear();
  // 月
  const m = (data.getMonth() + 1).toLocaleString().padStart(2, "0");
  // 日
  const d = data
    .getDate()
    .toLocaleString()
    .padStart(2, "0");
  // 小时
  const hh = data
    .getHours()
    .toLocaleString()
    .padStart(2, "0");
  // 分
  const mm = data
    .getMinutes()
    .toLocaleString()
    .padStart(2, "0");
  // 秒
  const ss = data
    .getSeconds()
    .toLocaleString()
    .padStart(2, "0");

  // 返回
  return `${y}-${m}-${d} ${hh}:${mm}:${ss}`;
});

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
