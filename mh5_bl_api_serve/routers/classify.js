// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 二、db数据库文件
const db = require('../db');
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