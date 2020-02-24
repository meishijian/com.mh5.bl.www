import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

// 引入vant
import Vant from 'vant';
import 'vant/lib/index.css';
Vue.use(Vant);



import { main_host } from './config.js'
import axios from 'axios';
// 配置axios请求的地址
axios.defaults.baseURL = main_host;
// axios.defaults.baseURL = "http://m.chenmsj.com:59885/api/v1/";
Vue.prototype.$http = axios;

// 引入mock
import "./mock"
// 引入css
import "./assets/css/css.css"
import vueToTop from 'vue-totop'
Vue.use(vueToTop)
//配置发送请求前的拦截器 可以设置token信息 
axios.interceptors.request.use(config => {
  let token = localStorage.getItem("token");
  // console.log(token);

  if (token !== null) {
    config.headers.Authorization = "Bearer " + token;
  }
  // console.log(config);
  return config;
});


// 全局 过滤器
Vue.filter("dateFormat", (originVal) => {
  // console.log(originVal);
  // 1574445164416194193
  const data = new Date(originVal * 1000);
  // console.log(data);
  // console.log(data);
  // 年
  const y = data.getFullYear();
  // 月
  const m = (data.getMonth() + 1).toLocaleString().padStart(2, '0');
  // 日
  const d = data.getDate().toLocaleString().padStart(2, '0');
  // 小时
  const hh = data.getHours().toLocaleString().padStart(2, '0');
  // 分
  const mm = data.getMinutes().toLocaleString().padStart(2, '0');
  // 秒
  const ss = data.getSeconds().toLocaleString().padStart(2, '0');
  // console.log(hh);

  // 返回
  return `${y}-${m}-${d} ${hh}:${mm}:${ss}`;

})
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
