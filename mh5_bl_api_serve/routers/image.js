// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// path 准确路径
const path = require("path");
// 保存 图片路径 地址  
const picAddress = "../uploads/";

// 发送本地图片
router.get("/uploads/*", (req, res) => {
    let imgName = req.params[0];
    res.sendFile(path.join(__dirname, picAddress + imgName))
})

// 导出路由
module.exports = router;