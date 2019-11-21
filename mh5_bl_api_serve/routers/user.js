// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 二、db数据库文件
const db = require('../db');
// 解析 multer 使用 multer 解析 图片 buffter
const multer = require("multer");
// 使用 fs path  写入图片 
const fs = require("fs");
// path 准确路径
const path = require("path");

// 保存 图片路径 地址  
const picAddress = "../public/image/";
//  访问 服务器中的图片 路径  前端使用的图片路径是 服务器的路径图片地址
const fileBaseUrl = "http://192.168.86.129:9494/api/v1/public/image/";

// 上传头像
router.post("/pic_upload", multer().single("pic"), (req, res) => {

    // console.log(req.file);
    fs.writeFileSync(path.join(__dirname, picAddress + req.file.originalname), req.file.buffer);
    // 写入成功
    res.json({
        "code": 200,
        "url": fileBaseUrl + req.file.originalname
    })
})


// 发送 本地 图片
router.get("/public/image/*", (req, res) => {
    let imgName = req.params[0]
    res.sendFile(path.join(__dirname, picAddress + imgName))

})


// 导出路由
module.exports = router;