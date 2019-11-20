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



app.post("/api/v1/sms_send", (req, res) => {
    //这个phone还没有，用postman传递过来
    // console.log(req.body.phone);
    let random_code = (('000000' + Math.floor(Math.random() * 999999)).slice(-6));//随机码6位
    var queryData = querystring.stringify({
        "mobile": req.body.phone,  // 接受短信的用户手机号码
        "tpl_id": req.body.tpl_id,  // 您申请的短信模板ID，根据实际情况修改
        "tpl_value": `#code#=${random_code}`,  // 您设置的模板变量，根据实际情况修改
        "key": req.body.key,  // 应用APPKEY(应用详细页查询)
    });

    var queryUrl = 'http://v.juhe.cn/sms/send?' + queryData;

    request(queryUrl, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            console.log(body) // 打印接口返回内容

            var jsonObj = JSON.parse(body); // 解析接口返回的JSON内容
            // console.log(jsonObj)
            res.json(jsonObj);//将json返回过去。使用调试工具获取到对应的内容。
        } else {
            console.log('请求异常');
        }
    })
});


// 启动服务器
// 这些需要一致 把这些放在配置文件中 在这里使用 需要改的时候 就在配置文件中修改 就OK了

app.listen(9494, () => {
    console.log("http://127.0.0.1:9494");
})