(function(t){function a(a){for(var i,n,c=a[0],r=a[1],m=a[2],p=0,l=[];p<c.length;p++)n=c[p],Object.prototype.hasOwnProperty.call(s,n)&&s[n]&&l.push(s[n][0]),s[n]=0;for(i in r)Object.prototype.hasOwnProperty.call(r,i)&&(t[i]=r[i]);g&&g(a);while(l.length)l.shift()();return o.push.apply(o,m||[]),e()}function e(){for(var t,a=0;a<o.length;a++){for(var e=o[a],i=!0,n=1;n<e.length;n++){var c=e[n];0!==s[c]&&(i=!1)}i&&(o.splice(a--,1),t=r(r.s=e[0]))}return t}var i={},n={app:0},s={app:0},o=[];function c(t){return r.p+"js/"+({}[t]||t)+"."+{"chunk-086fbeb2":"0736389c","chunk-0c438640":"a53240e5","chunk-11c0b947":"a9b68dfe","chunk-1f84b40a":"011f5b51","chunk-2452eb91":"adc00782","chunk-2a4f7b77":"f024cbe2","chunk-5d288694":"5c722a68","chunk-6249008a":"46564c16","chunk-66e64a6d":"bad402a5","chunk-683e5dfb":"5bb69803","chunk-6cdf2ca1":"59925fab","chunk-6eb79550":"fffddd53","chunk-7461c953":"75cffe70","chunk-909c05d0":"c8c1ebf8","chunk-c9bdefbc":"b4b19a2d","chunk-d3851048":"7ad902fd","chunk-ecf75fee":"9ba707e0"}[t]+".js"}function r(a){if(i[a])return i[a].exports;var e=i[a]={i:a,l:!1,exports:{}};return t[a].call(e.exports,e,e.exports,r),e.l=!0,e.exports}r.e=function(t){var a=[],e={"chunk-086fbeb2":1,"chunk-0c438640":1,"chunk-11c0b947":1,"chunk-1f84b40a":1,"chunk-2452eb91":1,"chunk-2a4f7b77":1,"chunk-5d288694":1,"chunk-6249008a":1,"chunk-66e64a6d":1,"chunk-683e5dfb":1,"chunk-6cdf2ca1":1,"chunk-6eb79550":1,"chunk-7461c953":1,"chunk-909c05d0":1,"chunk-c9bdefbc":1,"chunk-d3851048":1,"chunk-ecf75fee":1};n[t]?a.push(n[t]):0!==n[t]&&e[t]&&a.push(n[t]=new Promise((function(a,e){for(var i="css/"+({}[t]||t)+"."+{"chunk-086fbeb2":"1754f131","chunk-0c438640":"dec170e9","chunk-11c0b947":"94733035","chunk-1f84b40a":"dec170e9","chunk-2452eb91":"fadb28aa","chunk-2a4f7b77":"745afa75","chunk-5d288694":"63333640","chunk-6249008a":"78130d7f","chunk-66e64a6d":"2bf8eaef","chunk-683e5dfb":"680e8c6d","chunk-6cdf2ca1":"9ba734c3","chunk-6eb79550":"020a49e2","chunk-7461c953":"9a553b16","chunk-909c05d0":"e80ab15a","chunk-c9bdefbc":"724d6009","chunk-d3851048":"2f89d535","chunk-ecf75fee":"0e9983e8"}[t]+".css",s=r.p+i,o=document.getElementsByTagName("link"),c=0;c<o.length;c++){var m=o[c],p=m.getAttribute("data-href")||m.getAttribute("href");if("stylesheet"===m.rel&&(p===i||p===s))return a()}var l=document.getElementsByTagName("style");for(c=0;c<l.length;c++){m=l[c],p=m.getAttribute("data-href");if(p===i||p===s)return a()}var g=document.createElement("link");g.rel="stylesheet",g.type="text/css",g.onload=a,g.onerror=function(a){var i=a&&a.target&&a.target.src||s,o=new Error("Loading CSS chunk "+t+" failed.\n("+i+")");o.code="CSS_CHUNK_LOAD_FAILED",o.request=i,delete n[t],g.parentNode.removeChild(g),e(o)},g.href=s;var u=document.getElementsByTagName("head")[0];u.appendChild(g)})).then((function(){n[t]=0})));var i=s[t];if(0!==i)if(i)a.push(i[2]);else{var o=new Promise((function(a,e){i=s[t]=[a,e]}));a.push(i[2]=o);var m,p=document.createElement("script");p.charset="utf-8",p.timeout=120,r.nc&&p.setAttribute("nonce",r.nc),p.src=c(t);var l=new Error;m=function(a){p.onerror=p.onload=null,clearTimeout(g);var e=s[t];if(0!==e){if(e){var i=a&&("load"===a.type?"missing":a.type),n=a&&a.target&&a.target.src;l.message="Loading chunk "+t+" failed.\n("+i+": "+n+")",l.name="ChunkLoadError",l.type=i,l.request=n,e[1](l)}s[t]=void 0}};var g=setTimeout((function(){m({type:"timeout",target:p})}),12e4);p.onerror=p.onload=m,document.head.appendChild(p)}return Promise.all(a)},r.m=t,r.c=i,r.d=function(t,a,e){r.o(t,a)||Object.defineProperty(t,a,{enumerable:!0,get:e})},r.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},r.t=function(t,a){if(1&a&&(t=r(t)),8&a)return t;if(4&a&&"object"===typeof t&&t&&t.__esModule)return t;var e=Object.create(null);if(r.r(e),Object.defineProperty(e,"default",{enumerable:!0,value:t}),2&a&&"string"!=typeof t)for(var i in t)r.d(e,i,function(a){return t[a]}.bind(null,i));return e},r.n=function(t){var a=t&&t.__esModule?function(){return t["default"]}:function(){return t};return r.d(a,"a",a),a},r.o=function(t,a){return Object.prototype.hasOwnProperty.call(t,a)},r.p="",r.oe=function(t){throw console.error(t),t};var m=window["webpackJsonp"]=window["webpackJsonp"]||[],p=m.push.bind(m);m.push=a,m=m.slice();for(var l=0;l<m.length;l++)a(m[l]);var g=p;o.push([0,"chunk-vendors"]),e()})({0:function(t,a,e){t.exports=e("56d7")},"56d7":function(t,a,e){"use strict";e.r(a);e("99af"),e("4de4"),e("0d03"),e("4d90"),e("e260"),e("e6cf"),e("cca6"),e("a79d");var i=e("2b0e"),n=function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",[e("router-view")],1)},s=[],o=e("2877"),c={},r=Object(o["a"])(c,n,s,!1,null,null,null),m=r.exports,p=(e("d3b7"),e("8c4f")),l=function(){var t=this,a=t.$createElement,i=t._self._c||a;return i("div",{staticClass:"home"},[i("van-nav-bar",{staticClass:"van-nav-bar"},[i("div",{staticClass:"fenl",attrs:{slot:"left"},on:{click:t.fenl},slot:"left"},[i("van-icon",{staticClass:"fenimg",attrs:{name:"bars",color:"#a8a8a8",size:"18px"}}),t._v("分类 ")],1),i("div",{attrs:{slot:"title"},slot:"title"},[i("van-search",{attrs:{placeholder:"搜索",shape:"round",disabled:"false"},on:{search:t.onSearch,click:t.goods_tiao},model:{value:t.value,callback:function(a){t.value=a},expression:"value"}})],1),i("div",{attrs:{slot:"right"},slot:"right"},[i("van-icon",{staticClass:"shopping",attrs:{name:"shopping-cart-o",color:"#838383",size:"25px"},on:{click:t.gouwuche}},[0==JSON.parse(t.infoData).length?i("span",{staticClass:"paid_p_span"},[t._v(t._s(JSON.parse(t.infoData).length))]):t._e()]),i("van-icon",{attrs:{name:"manager-o",color:"#838383",size:"25px"},on:{click:t.me}})],1)]),i("van-swipe",{staticClass:"swipe",attrs:{autoplay:3e3,"indicator-color":"white"}},t._l(t.imageData,(function(t){return i("van-swipe-item",{key:t.id},[i("img",{staticClass:"swipe_img",attrs:{src:t.image,alt:""}})])})),1),i("van-grid",{staticClass:"grid",attrs:{gutter:4,"column-num":5}},t._l(t.fenlData,(function(t,a){return i("van-grid-item",{key:a,attrs:{icon:t.img,text:t.p}})})),1),i("van-cell",{staticClass:"vancell",attrs:{value:"内容"}},[i("img",{staticClass:"cellimg",attrs:{src:"https://img22.iblimg.com/market-2/images/activity/1089050602.png",alt:""}}),i("span",{staticClass:"cells"},[t._v(" 查看更多 "),i("van-icon",{attrs:{name:"play"}})],1)]),i("van-tabs",{staticClass:"explosive",attrs:{swipeable:"",color:"transparent"}},t._l(t.moneyData,(function(a,e){return i("van-tab",{key:e},[i("div",{attrs:{slot:"title"},slot:"title"},[i("img",{staticClass:"tabsimg",attrs:{src:a.image,alt:""}}),i("p",{staticClass:"tabs-p"},[t._v(t._s(a.p))]),i("span",{staticClass:"tabs-span"},[t._v(t._s(a.span))])])])})),1),i("van-cell",{staticClass:"vancells",attrs:{value:"内容"}},[i("img",{staticClass:"cellimgs",attrs:{src:"https://img23.iblimg.com/marketgif-1/images/activity/970427391.png",alt:""}}),i("span",{staticClass:"cellss"},[t._v(" 查看更多 "),i("van-icon",{attrs:{name:"play"}})],1)]),i("van-tabs",{staticClass:"pintuan",attrs:{swipeable:"",color:"transparent"}},t._l(t.assembleData,(function(a,e){return i("van-tab",{key:e},[i("div",{staticClass:"pintuans",attrs:{slot:"title"},slot:"title"},[i("img",{staticClass:"tabsimgs",attrs:{src:a.image,alt:""}}),i("p",{staticClass:"tabs-title"},[t._v(t._s(a.title))]),i("span",{staticClass:"tabs-spans"},[t._v(t._s(a.span))]),i("p",{staticClass:"tabs-pp"},[t._v(t._s(a.p))]),i("div",{staticClass:"kaituan"},[t._v("去开团")])])])})),1),i("p",{staticClass:"xiang"},[t._v("相见恨晚.边看边买")]),i("van-swipe",{staticClass:"x-swipe",attrs:{autoplay:3e3,"indicator-color":"white"}},t._l(t.meetData,(function(t,a){return i("van-swipe-item",{key:a},[i("img",{staticClass:"xiang_swipe",attrs:{src:t.image,alt:""}})])})),1),t._m(0),i("div",{staticClass:"jingping"},[i("img",{staticClass:"jinpimg",attrs:{src:"https://img22.iblimg.com/market-2/images/activity/39653131.png",alt:""}}),i("div",{staticClass:"jingping_gouge"},[i("van-grid",{attrs:{square:""}},t._l(t.selectedData,(function(a,e){return i("van-grid-item",{key:e,staticClass:"gouge",attrs:{text:"文字"}},[i("img",{staticClass:"gridimg",attrs:{src:a.image,alt:""}}),i("p",{staticClass:"jingping_gouge_p"},[t._v(t._s(a.p))]),i("span",{staticClass:"jingping_gouge_span"},[t._v(t._s(a.span))])])})),1)],1)]),i("p",{staticClass:"haohuo"},[t._v("好货排行榜")]),i("van-tabs",{staticClass:"haohuo-tabs",attrs:{swipeable:"",color:"transparent"}},t._l(t.qualityData,(function(a,e){return i("van-tab",{key:e},[i("div",{attrs:{slot:"title"},slot:"title"},[i("img",{staticClass:"haohuo_img",attrs:{src:a.sort_image,alt:""}}),i("p",{staticClass:"haohuo_p"},[t._v(t._s(a.sort_name))])])])})),1),i("van-tabs",{staticClass:"bra-tabs",attrs:{swipeable:"",color:"transparent"}},t._l(t.brandData,(function(a,e){return i("van-tab",{key:e},[i("div",{staticClass:"brand",attrs:{slot:"title"},slot:"title"},[i("img",{staticClass:"bra_img",attrs:{src:a.bra_image,alt:""}}),i("p",{staticClass:"bra_p"},[t._v(t._s(a.bra_name))])])])})),1),i("img",{staticClass:"xiadan",attrs:{src:e("dffe"),alt:""}}),i("p",{staticClass:"selected"},[t._v("精选活动")]),i("img",{staticClass:"selected_img",attrs:{src:"https://img23.iblimg.com/market-3/images/activity/238953964.jpg",alt:""}}),i("van-tabs",{staticClass:"huodong",attrs:{swipeable:"",color:"transparent"}},t._l(t.activityData,(function(t,a){return i("van-tab",{key:a},[i("div",{attrs:{slot:"title"},slot:"title"},[i("img",{staticClass:"huodong_img",attrs:{src:t.img,alt:""}})])])})),1),i("h3",[t._v("猜你喜欢")]),i("van-list",{attrs:{finished:t.finished,"finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(a){t.loading=a},expression:"loading"}},[i("van-grid",{attrs:{"column-num":2}},t._l(t.likeData,(function(a,e){return i("van-grid-item",{key:e,on:{click:function(e){return t.like_shop(a.id)}}},[i("img",{staticClass:"like_img",attrs:{src:a.image,alt:""}}),i("p",{staticClass:"like_p"},[t._v(t._s(a.goods_name))]),i("p",{staticClass:"like_jia"},[t._v("￥"+t._s(a.price))])])})),1)],1),i("vueToTop",{staticClass:"totop_i",attrs:{type:"5",right:"30",bottom:"70",size:"22",top:"1000"}})],1)},g=[function(){var t=this,a=t.$createElement,e=t._self._c||a;return e("div",[e("img",{staticClass:"x-img",attrs:{src:"https://img22.iblimg.com/market-3/images/activity/473598936.jpg",alt:""}}),e("img",{staticClass:"x-imgs",attrs:{src:"https://img22.iblimg.com/market-3/images/activity/637010217.jpg",alt:""}})])}],u=(e("a4d3"),e("4160"),e("e439"),e("dbb4"),e("b64b"),e("159b"),e("284c")),d=e("2fa7"),h=e("2f62");function b(t,a){var e=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);a&&(i=i.filter((function(a){return Object.getOwnPropertyDescriptor(t,a).enumerable}))),e.push.apply(e,i)}return e}function f(t){for(var a=1;a<arguments.length;a++){var e=null!=arguments[a]?arguments[a]:{};a%2?b(e,!0).forEach((function(a){Object(d["a"])(t,a,e[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(e)):b(e).forEach((function(a){Object.defineProperty(t,a,Object.getOwnPropertyDescriptor(e,a))}))}return t}var v={data:function(){return{value:"",imageData:[],fenlData:[{id:1,img:"https://img23.iblimg.com/market-2/images/activity/431458669.png",p:"八佰伴"},{id:2,img:"https://img22.iblimg.com/market-2/images/activity/195362033.png",p:"闪购"},{id:3,img:"https://img22.iblimg.com/market-2/images/activity/1669004729.png",p:"到家"},{id:4,img:"https://img22.iblimg.com/market-2/images/activity/55730966.png",p:"品牌团"},{id:5,img:"https://img22.iblimg.com/market-2/images/activity/1752633857.png",p:"篮筐"},{id:6,img:"https://img23.iblimg.com/market-2/images/activity/1647131699.png",p:"全球购"},{id:7,img:"https://img23.iblimg.com/market-2/images/activity/666204858.png",p:"百联卡"},{id:8,img:"https://img23.iblimg.com/market-2/images/activity/2019575694.png",p:"领劵"},{id:9,img:"https://img22.iblimg.com/market-2/images/activity/1268963070.png",p:"充值"},{id:10,img:"https://img23.iblimg.com/market-2/images/activity/190234359.png",p:"停车"}],moneyData:[{id:1,image:"https://Img.iblimg.com/photo-42/3030/2105850222_200x200.jpg",p:"￥45",span:"参考价￥65"},{id:2,image:"https://img19.iblimg.com/mp-175/mp/goods/1767512715_200x200.jpg",p:"￥13",span:"参考价￥13"},{id:3,image:"https://Img.iblimg.com/photo-42/3060/1152794105_200x200.jpg",p:"￥17.5",span:"参考价￥22.9"},{id:4,image:"https://Img.iblimg.com/photo-45/3020/1901664192_200x200.jpeg",p:"￥199",span:"参考价￥399"},{id:5,image:"https://img17.iblimg.com/mp-175/mp/goods/456475406_200x200.jpg",p:"￥105",span:"参考价￥65"},{id:6,image:"https://Img.iblimg.com/photo-45/3030/1788921977_200x200.jpg",p:"￥9.9",span:"参考价￥39"},{id:7,image:"https://Img.iblimg.com/photo-42/3020/609174818_200x200.jpg",p:"￥1299",span:"参考价￥1799"},{id:8,image:"https://Img.iblimg.com/photo-44/3020/1611420488_200x200.jpg",p:"￥99",span:"参考价￥699"},{id:9,image:"https://Img33.iblimg.com/goods-16/3030/2016/10/SP_3030_303001506723_01_10006.jpg",p:"￥38",span:"参考价￥38"},{id:10,image:"https://Img.iblimg.com/photo-42/3020/467380432_200x200.jpg",p:"￥99",span:"参考价￥128"},{id:11,image:"https://Img.iblimg.com/photo-45/3020/2007830833_200x200.jpeg",p:"￥30.9",span:"参考价￥59.8"},{id:12,image:"https://Img.iblimg.com/photo-42/3030/957109114_200x200.jpg",p:"￥241",span:"参考价￥389"},{id:13,image:"https://Img.iblimg.com/photo-46/1000/1103762204_200x200.jpg",p:"￥19.8",span:"参考价￥19.8"},{id:14,image:"https://Img.iblimg.com/photo-42/3020/208623902_200x200.jpeg",p:"￥399",span:"600"},{id:15}],assembleData:[{id:1,image:"https://img19.iblimg.com/mp-175/mp/goods/161244020_800x800.jpg",title:"壹食壹品 壹食壹品...",span:"2人团 | ￥49.80",p:"单买￥59.00"},{id:2,image:"https://img20.iblimg.com/mp-176/mp/goods/1358765487_800x800.jpg",title:"Blackmores 澳佳...",span:"2人团 | ￥69.00",p:"单买￥115.00"},{id:3,image:"https://img20.iblimg.com/mp-178/mp/goods/1864527459_800x800.jpg",title:"LANCOME 兰蔻...",span:"2人团 | ￥279.00",p:"单买￥329.00"},{id:4,image:"https://img20.iblimg.com/mp-175/mp/goods/410971919_800x800.jpg",title:"飞利浦 (PHILIPS)...",span:"2人团 | ￥199.00",p:"单买￥399.00"},{id:5,image:"https://img18.iblimg.com/mp-175/mp/goods/566506431_800x800.jpg",title:"THE BODY SHOP...",span:"2人团 | ￥70.00",p:"单买￥80.00"},{id:6,image:"https://img17.iblimg.com/mp-176/mp/goods/770313627_800x800.jpg",title:"FANCL 芳珂 无添...",span:"2人团 | ￥169.00",p:"单买 ￥107.00"}],selectedData:[{id:1,image:"https://img13.iblimg.com/goods-132/2000/2017/02/SP_2000_20000265151001_01_10009.jpg",p:"囤货小当家",span:"会囤货会生活"},{id:2,image:"https://img20.iblimg.com/mp-175/mp/goods/37098407_220x220.jpg",p:"水润护肤",span:"为您推荐"},{id:3,image:"https://Img.iblimg.com/photo-32/2000/988168636_220x220.jpg",p:"薯动全城",span:"为您推荐"},{id:4,image:"https://img16.iblimg.com/mp-175/mp/goods/1465456123_220x220.jpg",p:"缤纷彩妆",span:"缤纷彩妆"},{id:5,image:"https://Img33.iblimg.com/photo-3/3030/1048889630_220x220.jpg",p:"美味下午茶",span:"不负午后时光"},{id:6,image:"https://Img.iblimg.com/photo-42//1739704413_220x220.jpg",p:"姨妈小驻",span:"呵护那几天"},{id:7,image:"https://Img34.iblimg.com/goods-26/2000/2016/11/SP_2000_20000849831001_01_10009.jpg",p:"速冻美味",span:"为你推荐"},{id:8,image:"https://Img.iblimg.com/photo-42//872861721_220x220.jpg",p:"衣物洗护",span:"为你推荐"}],qualityData:[],brandData:[],activityData:[{id:1,img:"https://img22.iblimg.com/market-3/images/activity/1258469836.jpg"},{id:2,img:"https://img22.iblimg.com/market-3/images/activity/369569308.jpg"},{id:3,img:"https://img22.iblimg.com/market-3/images/activity/755948825.jpg"},{id:4,img:"https://img23.iblimg.com/market-3/images/activity/551841080.jpg"},{id:4,img:"https://img22.iblimg.com/market-3/images/activity/1258469836.jpg"}],likeData:[],meetData:[],loading:!1,finished:!1}},methods:f({},Object(h["b"])(["getInfoData"]),{onSearch:function(){},gouwuche:function(){this.$router.push("/shopping")},goods_tiao:function(){this.$router.push("/search")},fenl:function(){this.$router.push("/class")},me:function(){this.$router.push("/me")},imageList:function(){var t=this;this.$http.get("main_ad_images").then((function(a){t.imageData=a.data.data}))},meetList:function(){var t=this;this.$http.get("/main_small_images").then((function(a){t.meetData=a.data.data}))},qualityList:function(){var t=this;this.$http.get("/main_goods_ranking").then((function(a){t.qualityData=a.data.data}))},brandList:function(){var t=this;this.$http.get("/main_brand_ranking").then((function(a){t.brandData=a.data.data}))},likeList:function(){},like_shop:function(t){localStorage.setItem("list_id",t),this.$router.push("/goodsDetail")},onLoad:function(){var t=this;setTimeout((function(){t.$http.get("/guess").then((function(a){var e;(e=t.likeData).push.apply(e,Object(u["a"])(a.data.data))})),t.loading=!1,t.likeData.length>=40&&(t.finished=!0)}),1e3)}}),created:function(){this.imageList(),this.meetList(),this.qualityList(),this.brandList(),this.likeList()},computed:f({},Object(h["c"])(["infoData"]))},_=v,k=(e("de16"),Object(o["a"])(_,l,g,!1,null,null,null)),y=k.exports;i["a"].use(p["a"]);var j=[{path:"/",component:y},{path:"/class",component:function(){return e.e("chunk-ecf75fee").then(e.bind(null,"be7e"))}},{path:"/me",component:function(){return e.e("chunk-d3851048").then(e.bind(null,"0a99"))}},{path:"/goodslist",component:function(){return e.e("chunk-c9bdefbc").then(e.bind(null,"d2d3"))}},{path:"/search",component:function(){return e.e("chunk-5d288694").then(e.bind(null,"2d3b"))}},{path:"/goodsDetail",component:function(){return e.e("chunk-7461c953").then(e.bind(null,"5ebe"))}},{path:"/order",component:function(){return e.e("chunk-0c438640").then(e.bind(null,"cf2a"))},meta:{judge:!0}},{path:"/address",component:function(){return e.e("chunk-086fbeb2").then(e.bind(null,"a821"))}},{path:"/shopAddress",component:function(){return e.e("chunk-6249008a").then(e.bind(null,"e8c8"))}},{path:"/shopping",component:function(){return e.e("chunk-6cdf2ca1").then(e.bind(null,"aa3f"))}},{path:"/goodsSearch",component:function(){return e.e("chunk-66e64a6d").then(e.bind(null,"237c"))},meta:{judge:!0}},{path:"/login",component:function(){return e.e("chunk-2452eb91").then(e.bind(null,"a55b"))}},{path:"/regist",component:function(){return e.e("chunk-683e5dfb").then(e.bind(null,"879c"))}},{path:"/myInfo",component:function(){return e.e("chunk-909c05d0").then(e.bind(null,"4b7f"))},meta:{judge:!0}},{path:"/payment",component:function(){return e.e("chunk-11c0b947").then(e.bind(null,"1175"))},meta:{judge:!0}},{path:"/myorder/:numId",component:function(){return e.e("chunk-6eb79550").then(e.bind(null,"06d5"))},meta:{judge:!0}},{path:"/orderSorry",component:function(){return e.e("chunk-1f84b40a").then(e.bind(null,"d810"))},meta:{judge:!0}},{path:"/userNickname",component:function(){return e.e("chunk-2a4f7b77").then(e.bind(null,"dee1"))},meta:{judge:!0}}],C=new p["a"]({mode:"history",base:"",routes:j});C.beforeEach((function(t,a,e){if(void 0!==t.meta&&void 0!==t.meta.judge&&t.meta.judge){var i=localStorage.getItem("token");null==i?e("/login"):e()}else e()}));var x=C;i["a"].use(h["a"]);var w=new h["a"].Store({state:{infoData:localStorage.getItem("goods_id")||0},mutations:{getInfoData:function(t,a){t.infoData=a}},actions:{},modules:{}}),D=e("b970"),S=(e("157a"),e("bc3a")),O=e.n(S),I=e("96eb"),L=e.n(I);L.a.mock("http://127.0.0.1:9595/api/v1/main_ad_images","get",{code:200,"data|8":[{image:"@dataImage(375x200)",link:"www.baidu.com"}]}),L.a.mock("http://127.0.0.1:9595/api/v1/main_small_images","get",{code:200,"data|2":[{image:"@dataImage(375x200)",link:"www.baidu.com"}]});e("7340");var P=e("6f69"),E=e.n(P);i["a"].config.productionTip=!1,i["a"].use(D["a"]),O.a.defaults.baseURL="http://101.200.195.47:9494/api/v1/",i["a"].prototype.$http=O.a,i["a"].use(E.a),O.a.interceptors.request.use((function(t){var a=localStorage.getItem("token");return null!==a&&(t.headers.Authorization="Bearer "+a),t})),i["a"].filter("dateFormat",(function(t){var a=new Date(1e3*t),e=a.getFullYear(),i=(a.getMonth()+1).toLocaleString().padStart(2,"0"),n=a.getDate().toLocaleString().padStart(2,"0"),s=a.getHours().toLocaleString().padStart(2,"0"),o=a.getMinutes().toLocaleString().padStart(2,"0"),c=a.getSeconds().toLocaleString().padStart(2,"0");return"".concat(e,"-").concat(i,"-").concat(n," ").concat(s,":").concat(o,":").concat(c)})),new i["a"]({router:x,store:w,render:function(t){return t(m)}}).$mount("#app")},7340:function(t,a,e){},"8d91":function(t,a,e){},de16:function(t,a,e){"use strict";var i=e("8d91"),n=e.n(i);n.a},dffe:function(t,a,e){t.exports=e.p+"img/Snipaste_2019-11-19_08-59-53.81b1074d.png"}});
//# sourceMappingURL=app.f464e15f.js.map