// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 二、db数据库文件
const db = require('../db');

// 商品
router.get("/goods_list", (req, res) => {
    // 分类id
    let cat_id = req.query.id;
    // 页数 
    let page = req.query.page || 1;
    // // 排序 升序 或 降序
    // const sortway = req.query.sortway;
    // // 
    // const volume = req.query.volume;
    const per_page = 10;
    // 定义拼接 变量
    let where = '';
    // 存放数据
    let datas = [];
    // 判断 id
    if (cat_id) {
        where = ` WHERE cat_id= ${cat_id}`;
    } else {
        return res.json({
            "code": 400,
            "error": "参数 ID 为空"
        })
    }
    // // 排序
    // const order = ` ORDER BY price ${sortway}`;
    // // 翻页
    // const offset = (page - 1) * per_page;
    // // console.log(offset);
    // // limit
    // const limit = ` LIMIT ${offset},${per_page}`;

    let mysql = "SELECT count(*) total FROM bl_goods WHERE cat_id= ?";
    db.query(mysql, cat_id, (error, data) => {
        let mysql = `SELECT id,goods_name,price,image,service FROM bl_goods ${where} `
        // console.log(mysql);
        db.query(mysql, (error, result) => {
            res.json({
                "code": 200,
                "total": data[0].total,
                "data": result
            })
        })
    })
})

// 搜索 商品
router.get("/goods_search", (req, res) => {
    // 商品名
    let goods_name = req.query.name;
    // 页数 
    let page = req.query.page || 1;
    // // 排序 升序 或 降序
    // const sortway = req.query.sortway || 'asc';

    const per_page = 10;
    // 定义拼接 变量
    let where = '';
    // 存放数据
    let datas = [];
    // 判断 用户名
    if (goods_name) {
        where = ` WHERE goods_name LIKE '%${goods_name}%'`;
    } else {
        return res.json({
            "code": 400,
            "error": "参数为空"
        })
    }
    // // 排序
    // const order = ` ORDER BY price ${sortway}`;
    // // 翻页
    // const offset = (page - 1) * per_page;
    // // console.log(offset);
    // // limit
    // const limit = ` LIMIT ${offset},${per_page}`;

    let mysql = `SELECT count(*) total FROM bl_goods WHERE goods_name LIKE '%${goods_name}%'`;
    db.query(mysql, (error, data) => {
        let mysql = `SELECT id,goods_name,price,image,service FROM bl_goods ${where}`
        // console.log(mysql);
        db.query(mysql, (error, result) => {
            res.json({
                "code": 200,
                "total": data[0].total,
                "data": result
            })
        })
    })
})

// 商品排序
router.post("/goods_sort", (req, res) => {
    let id = req.body.id;

    // 销量  0: 没销量  1: 销量  价格 2: 价格升序  3: 价格排序
    let volume = req.body.volume;
    console.log(volume);

    let where = "WHERE ";
    if (id) {
        where += ` id in (${String(id)})`;
    } else {
        return res.json({
            "code": 200,
            "error": "商品参数ID 为空"
        })
    }
    if (volume == 0) {
        where += '';
    } else if (volume == 1) {
        where += ` ORDER BY volume desc`;
    } else if (volume == 2) {
        where += ` ORDER BY price asc`;
    } else if (volume == 3) {
        where += ` ORDER BY price desc`;
    } else {
        return res.json({
            "code": 200,
            "error": "商品排序 为空"
        })
    }

    let mysql = `SELECT id,goods_name,price,image,service FROM bl_goods ${where}`;
    console.log(mysql);

    db.query(mysql, (error, result) => {
        res.json({
            "code": 200,
            "data": result
        })
    })


})
// 导出路由
module.exports = router;