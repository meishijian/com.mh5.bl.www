// 导入 express
const express = require('express');
// 导入 配置文件
const config = require('./config');
// app
const app = express();
// 跨域
const cors = require('cors');
app.use(cors({
    origin: ['http://localhost:8080'],  //指定接收的地址
    methods: ['GET', 'POST', "PUT", "DELETE"],  //指定接收的请求类型
    alloweHeaders: ['Content-Type', 'Authorization']  //指定header
}))

// body-parser
const bodyParser = require('body-parser');
// 配置 body-parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



// 引入 登录 路由并注册到 app 上
app.use('/api/v1', require("./routers/login"));
// 引入 首页 路由并注册到 app 上
app.use('/api/v1', require("./routers/home"));
// 引入 分类 路由并注册到 app 上
app.use('/api/v1', require("./routers/classify"));


// 启动服务器
// 这些需要一致 把这些放在配置文件中 在这里使用 需要改的时候 就在配置文件中修改 就OK了

app.listen(9494, "127.0.0.1", () => {
    console.log("http://127.0.0.1:9494");
})