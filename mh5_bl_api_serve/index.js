// 导入 express
const express = require('express');
// app
const app = express();
// 跨域
const cors = require('cors');
app.use(cors())

// body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.json());
// 配置 body-parser
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static("dist"));
app.use(express.static("public"));

// 引入 登录 路由并注册到 app 上
app.use('/api/v1', require("./routers/login"));
// 引入 首页 路由并注册到 app 上
app.use('/api/v1', require("./routers/home"));
// 引入 分类 路由并注册到 app 上
app.use('/api/v1', require("./routers/classify"));
// 引入 商品 路由并注册到 app 上
app.use('/api/v1', require("./routers/goods_list"));
// 引入 收货 路由并注册到 app 上
app.use('/api/v1', require("./routers/address"));
// 引入 用户 路由并注册到 app 上
app.use('/api/v1', require("./routers/user"));

// 后台管理系统
app.use('/api/v1', require("./routers/backstage/login")); 


// 启动服务器
// 这些需要一致 把这些放在配置文件中 在这里使用 需要改的时候 就在配置文件中修改 就OK了
app.listen(59885, () => {
    console.log("至高无上的服务器已成功开启！");
})