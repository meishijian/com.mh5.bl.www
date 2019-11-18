// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 二、db数据库文件
const db = require('../db');

// 轮播图
router.get("/main_ad_images", (req, res) => {
    // 查询 轮播图
    let mysql = "SELECT * FROM `bl_swipe_images`";
    db.query(mysql, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error
        })
        let data = []
        result.forEach((element, index) => {
            if (element.id <= 5) {
                data.push(element)
            }
        });
        res.json({
            "code": 200,
            data
        })
    })
})

// 相见恨晚·边看边买 下面的小轮播
router.get("/main_small_images", (req, res) => {

    // 查询 轮播图
    let mysql = "SELECT * FROM `bl_swipe_images`";
    db.query(mysql, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error
        })
        let data = []
        result.forEach((element, index) => {
            if (element.id > 5) {
                data.push(element)
            }
        });
        res.json({
            "code": 200,
            data
        })
    })
})

// 好货排行榜
router.get("/main_goods_ranking", (req, res) => {
    // let num = Math.random()*;
    let mysql = "SELECT count(*) c FROM bl_sort";
    db.query(mysql, (error, result) => {
        // console.log(result[0].c);
        let num = Math.floor(Math.random() * result[0].c);
        for (let i = 0; i < result[0].c; i++) {
            if (result[0].c - 10 < num) {
                num = Math.floor(Math.random() * result[0].c);
            }
        }
        // 查询 轮播图
        let mysql = `SELECT id,sort_name,sort_image FROM bl_sort LIMIT ${num},10`;
        db.query(mysql, (error, data) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })
            res.json({
                "code": 200,
                data
            })
        })
    })
})

// 品牌排行榜
router.get("/main_brand_ranking", (req, res) => {
    // let num = Math.random()*;
    let mysql = "SELECT count(*) c FROM bl_brand";
    db.query(mysql, (error, result) => {
        // console.log(result[0].c);
        let num = Math.floor(Math.random() * result[0].c);
        for (let i = 0; i < result[0].c; i++) {
            if (result[0].c - 10 < num) {
                num = Math.floor(Math.random() * result[0].c);
            }
        }
        // 查询 轮播图
        let mysql = `SELECT id,bra_name,bra_image FROM bl_brand LIMIT ${num},10`;
        db.query(mysql, (error, data) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })
            res.json({
                "code": 200,
                data
            })
        })
    })
})

// 猜你喜欢
router.get("/guess", (req, res) => {
    let mysql = "SELECT count(*) c FROM bl_goods";
    db.query(mysql, (error, result) => {
        // console.log(result[0].c);
        let num = Math.floor(Math.random() * result[0].c);
        for (let i = 0; i < result[0].c; i++) {
            if (result[0].c - 10 < num) {
                num = Math.floor(Math.random() * result[0].c);
            }
        }

        // 查询 轮播图
        let mysql = `SELECT id,goods_name,image,price FROM bl_goods LIMIT ${num},10`;
        db.query(mysql, (error, data) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })
            res.json({
                "code": 200,
                data
            })
        })
    })
})
// 商品分类 左侧菜单
router.get("/goods_left_side", (req, res) => {
    let mysql = 'SELECT  * FROM bl_classify';
    db.query(mysql, (error, result) => {
        res.json({
            "code": 200,
            'data': result
        })
    })
})
// 商品 右侧分类
router.get("/goods_right_sort", (req, res) => {
    let id = req.query.id;
    let mysql = 'SELECT  id,cat_title FROM bl_categories a  WHERE class_id = ?';
    db.query(mysql, id, (error, result) => {
        let mysql = 'SELECT  b.* FROM bl_sort b left join  bl_categories a  ON a.id = b.cat_id';
        db.query(mysql, (error, result1) => {
            result.forEach((element, index) => {
                let data = [];
                result1.forEach((element1, index1) => {
                    // console.log(element);
                    if (element.id == element1.cat_id) {
                        data.push({
                            id: element1.id,
                            sort_name: element1.sort_name,
                            sort_image: element1.sort_image
                        });
                    }
                });
                result[index].children = data;
            });
            res.json({
                "code": 200,
                "data": result
            })
        })
    });
})

// 导出路由
module.exports = router;