import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

// 引入vant
import Vant from 'vant';
import 'vant/lib/index.css';

Vue.use(Vant);

import axios from 'axios';
// 配置axios请求的地址
axios.defaults.baseURL = "http://127.0.0.1:9494/api/v1/";
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


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
