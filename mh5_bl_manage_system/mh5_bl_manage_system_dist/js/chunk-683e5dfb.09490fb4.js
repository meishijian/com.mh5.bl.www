(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-683e5dfb"],{"102d":function(e,o,r){},"879c":function(e,o,r){"use strict";r.r(o);var t=function(){var e=this,o=e.$createElement,t=e._self._c||o;return t("div",{staticClass:"login"},[t("el-card",{staticClass:"box-card"},[t("div",{staticClass:"clearfix",attrs:{slot:"header"},slot:"header"},[t("span",[e._v("注册")]),t("el-button",{staticStyle:{float:"right",padding:"3px 0"},attrs:{type:"text"},on:{click:e.regist}},[e._v("已注册店铺，返回登录界面")])],1),t("div",{staticClass:"text item"},[t("div",{staticClass:"login-pic"},[t("img",{attrs:{src:r("76ec")}})]),t("el-form",{ref:"loginFormRef",staticClass:"demo-ruleForm",attrs:{model:e.loginForm,rules:e.loginFormRules,"label-width":"100px"}},[t("el-form-item",{attrs:{label:"用户名",prop:"mobile"}},[t("el-input",{model:{value:e.loginForm.mobile,callback:function(o){e.$set(e.loginForm,"mobile",o)},expression:"loginForm.mobile"}})],1),t("el-form-item",{attrs:{label:"密码",prop:"password"}},[t("el-input",{attrs:{"show-password":""},model:{value:e.loginForm.password,callback:function(o){e.$set(e.loginForm,"password",o)},expression:"loginForm.password"}})],1),t("el-form-item",{attrs:{label:"商家店铺名",prop:"bra_name"}},[t("el-input",{model:{value:e.loginForm.bra_name,callback:function(o){e.$set(e.loginForm,"bra_name",o)},expression:"loginForm.bra_name"}})],1),t("el-form-item",{attrs:{label:"店铺名称"}},[t("el-button",{attrs:{size:"small",type:"warning"},on:{click:e.toggleShow}},[e._v("点击上传")]),t("my-upload",{attrs:{width:80,height:48,"img-format":"png",size:e.size,langType:"zh",noRotate:!1,noSquare:!0,noCircle:!0,field:"file",url:e.uploadURL,headers:e.headersObj},on:{"crop-upload-success":e.cropUploadSuccess,"crop-upload-fail":e.cropUploadFail},model:{value:e.show,callback:function(o){e.show=o},expression:"show"}}),t("br"),t("el-image",{attrs:{src:e.imgDataUrl}},[t("div",{staticClass:"image-slot",attrs:{slot:"error"},slot:"error"})])],1),t("el-form-item",[t("el-button",{attrs:{type:"primary"},on:{click:e.submitForm}},[e._v("登录")]),t("el-button",{on:{click:e.resetForm}},[e._v("重置")])],1)],1)],1)])],1)},s=[],a=(r("db4d"),r("0b4d")),i=r("db49"),l={data:function(){return{imgDataUrl:"",show:!1,size:2.1,uploadURL:i["a"],headersObj:{Authorization:sessionStorage.getItem("token")},loginForm:{mobile:"",password:"",bra_name:"",bra_image:""},loginFormRules:{mobile:[{required:!0,message:"请输入用户名",trigger:"blur"}],bra_name:[{required:!0,message:"请输入用户名",trigger:"blur"}],password:[{required:!0,message:"请输入密码",trigger:"blur"}]}}},components:{"my-upload":a["a"]},methods:{toggleShow:function(){this.show=!this.show},cropUploadSuccess:function(e,o){if(200!==e.code)return this.$message.error("上传失败，请重试");this.imgDataUrl=i["b"]+e.file,this.loginForm.bra_image=e.file},cropUploadFail:function(e,o){this.$message.error("上传失败，请重试")},submitForm:function(){var e=this;this.$refs.loginFormRef.validate((function(o){return o?""===e.loginForm.bra_image?e.$message.error("店铺图片不能为空!"):void e.$http.post("/regist_brand",e.loginForm).then((function(o){if(console.log(o),400==o.data.code)return e.$message.error(o.data.error);e.$message.success("注册成功"),e.$router.push("/login_brand")})):e.$message.error("错了哦，输入用户名或密码")}))},resetForm:function(){this.$refs.loginFormRef.resetFields()},regist:function(){this.$router.push("/login")}}},n=l,m=(r("f06b"),r("2877")),c=Object(m["a"])(n,t,s,!1,null,null,null);o["default"]=c.exports},f06b:function(e,o,r){"use strict";var t=r("102d"),s=r.n(t);s.a}}]);
//# sourceMappingURL=chunk-683e5dfb.09490fb4.js.map