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
Vue.prototype.$http = axios;






import "./assets/css/index.css"
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
