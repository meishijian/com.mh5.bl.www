// 导入 二、db数据库文件
const db = require('../db');
// 导入 全体配置文件
const config = require('../config');
// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 获取 upload
const { upload } = require('../util');

// 上传图片
router.post("/upload", upload.single('file'), (req, res) => {
    // 失败
    if (!req.file) {
        return res.json({
            'code': 400,
            'error': "上传参数不能为空!"
        });
    }
    // 成功
    res.json({
        'code': 200,
        'file': req.file.path
    });
})

// 导出路由
module.exports = router;