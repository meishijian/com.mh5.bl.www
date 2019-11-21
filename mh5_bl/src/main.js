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
axios.defaults.baseURL = "http://192.168.86.129:9494/api/v1/";
Vue.prototype.$http = axios;

// 引入mock
import "./mock"
// 引入css
import "./assets/css/css.css"



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");