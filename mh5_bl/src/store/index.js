import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    infoData: localStorage.getItem("goods_id") || 0,
    id:  localStorage.getItem("goods_id") || 0,
  },
  mutations: {

    getInfoData(state, data) {
      state.infoData = data
    },
    getId(state, data) {
      state.id = data
    }
  },
  actions: {
  },
  modules: {
  }
})
