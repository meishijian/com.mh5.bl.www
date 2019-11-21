// 导入 express
const express = require('express');

const request = require('request');//后端也要请求接口
const querystring = require('querystring');

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


// 启动服务器
// 这些需要一致 把这些放在配置文件中 在这里使用 需要改的时候 就在配置文件中修改 就OK了

app.listen(9494, () => {
    console.log("http://127.0.0.1:9494");
})