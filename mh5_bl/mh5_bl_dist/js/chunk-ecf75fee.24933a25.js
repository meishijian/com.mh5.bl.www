(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-ecf75fee"],{"5ec1":function(t,a,n){"use strict";var s=n("c167"),o=n.n(s);o.a},be7e:function(t,a,n){"use strict";n.r(a);var s=function(){var t=this,a=t.$createElement,n=t._self._c||a;return n("div",{staticClass:"box"},[n("van-nav-bar",{attrs:{title:"标题"}},[n("div",{attrs:{slot:"left"},slot:"left"},[n("van-search",{attrs:{placeholder:"搜索你想要的商品",disabled:"false"},on:{click:t.goods_tiao}})],1),n("div",{attrs:{slot:"right"},slot:"right"},[t.icon?n("van-icon",{attrs:{name:"ellipsis",color:"#8d8d8d",size:"26px"},on:{click:function(a){t.icon=!t.icon}}}):n("van-icon",{attrs:{name:"cross",color:"red",size:"26px"},on:{click:function(a){t.icon=!t.icon}}})],1)]),n("div",{staticClass:"dahang"},[0==t.icon?n("van-tabbar",{staticClass:"dahang_tabbar"},[n("van-tabbar-item",{attrs:{icon:"home-o",to:"/"}},[t._v("首页")]),n("van-tabbar-item",{attrs:{icon:"search",to:"/search"}},[t._v("搜索")]),n("van-tabbar-item",{attrs:{icon:"bars",to:"/class"}},[t._v("分类")]),n("van-tabbar-item",{attrs:{icon:"shopping-cart-o",to:"/shopping"}},[t._v("购物车")]),n("van-tabbar-item",{attrs:{icon:"manager-o",to:"/me"}},[t._v("我的i百联")])],1):t._e()],1),n("van-row",[n("van-col",{attrs:{span:"6"}},[n("van-sidebar",{staticClass:"sidebar",on:{change:t.change},model:{value:t.activeKey,callback:function(a){t.activeKey=a},expression:"activeKey"}},t._l(t.goodsDate,(function(t,a){return n("van-sidebar-item",{key:a,attrs:{title:t.cla_name}})})),1)],1),n("van-col",{attrs:{span:"18"}},t._l(t.goodsnameDate,(function(a,s){return n("div",{key:s},[n("p",{staticClass:"goodsnameDate_p"},[t._v(t._s(a.cat_title))]),n("van-grid",{attrs:{"column-num":3}},t._l(a.children,(function(a,s){return n("van-grid-item",{key:s,on:{click:function(n){return t.children(a.id)}}},[n("img",{staticClass:"children_img",attrs:{src:a.sort_image,alt:""}}),n("p",{staticClass:"children_p"},[t._v(t._s(a.sort_name))])])})),1)],1)})),0)],1)],1)},o=[],i={data:function(){return{activeKey:0,goodsDate:[],goodsnameDate:[],icon:!0}},methods:{goodsList:function(){var t=this;this.$http.get("/goods_left_side").then((function(a){t.goodsDate=a.data.data}))},change:function(t){var a=this;this.$http.get("/goods_right_sort",{params:{id:t+1}}).then((function(t){a.goodsnameDate=t.data.data}))},goodsnameList:function(){var t=this;this.$http.get("/goods_right_sort",{params:{id:1}}).then((function(a){t.goodsnameDate=a.data.data}))},children:function(t){this.$router.push("/goodslist"),localStorage.setItem("id",t)},goods_tiao:function(){this.$router.push("/search")}},created:function(){this.goodsList(),this.goodsnameList()}},e=i,c=(n("5ec1"),n("2877")),r=Object(c["a"])(e,s,o,!1,null,null,null);a["default"]=r.exports},c167:function(t,a,n){}}]);
//# sourceMappingURL=chunk-ecf75fee.24933a25.js.map