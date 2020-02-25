// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 全体配置文件
const config = require('../config');
// 导入 二、db数据库文件
const db = require('../db');

// 轮播图
router.get("/main_ad_images", (req, res) => {
    // 【可选】 页数
    const page = req.query.pagenum || 1;
    // 【可选】 一条多少数据
    const pagesize = req.query.pagesize || 5;

    const sortway = req.query.sortway || 'DESC';
    // 排序
    const order = ` ORDER BY id ${sortway}`;
    // 翻页
    let offset = (page - 1) * pagesize;
    // limit
    let limit = ` LIMIT ${offset},${pagesize}`;

    // mysql
    let mysql = `SELECT COUNT(*) total FROM bl_swipe_images`;

    db.query(mysql, (error, results) => {
        // 判断
        if (error) return res.json(error);
        // 总条数据
        let total = results[0].total;
        // 查询 轮播图
        let mysql = `SELECT * FROM bl_swipe_images  ${order} ${limit}`;
        db.query(mysql, (error, result) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })
            result.forEach(e => {
                e.image = e.image.indexOf("https://img") != -1 ? e.image : `http://${config.server.ip}:${config.server.port}/${e.image}`;
            });
            res.json({
                "code": 200,
                total,
                'data': result
            })
        })
    })

})

// 添加轮播图
router.post("/main_ad_images", (req, res) => {
    let image = req.body.image;
    let link = req.body.link;
    if (image === undefined) {
        return res.json({
            'code': 400,
            'error': '图片不能为空!'
        })
    }
    if (link === undefined) {
        return res.json({
            'code': 400,
            'error': '图片链接不能为空!'
        })
    }
    // mysql
    let mysql = `INSERT INTO bl_swipe_images SET ?`;
    db.query(mysql, req.body, (error, result) => {
        // 判断
        if (error) return res.json(error);

        res.json({
            'code': 200,
            'message': "添加轮播图成功"
        })
    })
})

// 回显轮播图
router.get('/main_ad_images/:id(\\d+)', (req, res) => {
    // 获取分类ID
    let id = req.params.id;
    // 分类ID 没有传时
    if (!id) {
        return res.json({
            "code": 400,
            "error": "轮播图ID不能为空"
        });
    }
    // 查询 该 分类ID
    // mysql
    let mysql = "SELECT * FROM bl_swipe_images WHERE id = ?";
    db.query(mysql, id, (error, result) => {
        // 判断
        if (error) return res.json(error);

        // 如果不存在 该ID
        if (result.length === 0) {
            return res.json({
                "code": 400,
                "error": "轮播图ID错误"
            });
        }
        console.log(result);

        result.forEach(e => {
            e.image = e.image.indexOf("https://img") != -1 ? e.image : `http://${config.server.ip}:${config.server.port}/${e.image}`;
        });
        // 成功时
        res.json({
            "code": 200,
            "data": result[0]
        })
    })
})

// 修改轮播图
router.put("/main_ad_images", (req, res) => {
    // 获取分类ID
    let id = req.body.id;
    let image = req.body.image;
    let link = req.body.link;
    if (id === undefined) {
        return res.json({
            'code': 400,
            'error': 'ID不能为空!'
        })
    }
    if (image === undefined) {
        return res.json({
            'code': 400,
            'error': '图片不能为空!'
        })
    }
    if (link === undefined) {
        return res.json({
            'code': 400,
            'error': '图片链接不能为空!'
        })
    }
    // mysql
    let mysql = "SELECT * FROM bl_swipe_images WHERE id = ?";
    db.query(mysql, id, (error, result) => {
        // 判断
        if (error) return res.json(error);
        // 如果不存在 该ID
        if (result.length === 0) {
            return res.json({
                "code": 400,
                "error": "不存在该轮播"
            });
        }
        // 进行修改 编辑
        mysql = "UPDATE bl_swipe_images SET image = ?,link = ? WHERE id = ?";
        db.query(mysql, [image, link, id], (error, result) => {
            // 判断
            if (error) return res.json(error);
            // 修改编辑 成功
            res.json({
                "code": 200,
                "message": "修改轮播图成功"
            });
        })
    })

})

// 删除轮播图
router.delete("/main_ad_images/:id(\\d+)", (req, res) => {
    // 获取分类ID
    let id = req.params.id;
    // 分类ID 没有传时
    if (!id) {
        return res.json({
            "code": 400,
            "error": "ID不能为空"
        });
    }
    // mysql
    let mysql = "SELECT * FROM bl_swipe_images WHERE id = ?";
    db.query(mysql, id, (error, result2) => {
        // 判断
        if (error) return res.json(error);
        // console.log(result[0].id);
        if (result2.length === 0) {
            return res.json({
                'code': 400,
                "error": "ID不正确"
            })
        }
        // 三级
        mysql = `DELETE FROM bl_swipe_images WHERE id in ( ${id} )`;
        db.query(mysql, (error, resuly) => {
            // 判断
            if (error) return res.json(error);

            res.json({
                "code": 200,
                "message": "删除成功"
            });
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
        data.forEach(e => {
            e.image = e.image.indexOf("https://img") != -1 ? e.image : `http://${config.server.ip}:${config.server.port}/${e.image}`;
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
        let num = [];
        for (let i = 0; i < 10; i++) {
            num.push(Math.floor(Math.random() * result[0].c))

        }
        // 查询 轮播图
        let mysql = `SELECT id,sort_name,sort_image FROM bl_sort WHERE id IN (${num})`;

        db.query(mysql, (error, data) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })

            data.forEach(e => {
                // 店铺图标
                e.sort_image = e.sort_image.indexOf("https://") != -1 ? e.sort_image : `http://${config.server.ip}:${config.server.port}/${e.sort_image}`;
            });
            res.json({
                "code": 200,
                data
            })
        })

        // console.log(result[0].c);
        // let num = Math.floor(Math.random() * result[0].c);
        // for (let i = 0; i < result[0].c; i++) {
        //     if (result[0].c - 10 < num) {
        //         num = Math.floor(Math.random() * result[0].c);
        //     }
        // }
        // // 查询 轮播图
        // let mysql = `SELECT id,sort_name,sort_image FROM bl_sort LIMIT ${num},10`;

        // db.query(mysql, (error, data) => {
        //     if (error) return res.json({
        //         "code": 400,
        //         "error": error
        //     })
        //     res.json({
        //         "code": 200,
        //         data
        //     })
        // })
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
            data.forEach(e => {
                // 店铺图标
                e.bra_image = e.bra_image.indexOf("http://img") != -1 ? e.bra_image : `http://${config.server.ip}:${config.server.port}/${e.bra_image}`;
            });
            res.json({
                "code": 200,
                data
            })
        })
    })
})

// 猜你喜欢
router.get("/guess", (req, res) => {
    // console.log(11);
    // let page = req.query.page;
    let mysql = "SELECT id FROM bl_goods";
    db.query(mysql, (error, result) => {
        let num = [];
        for (; num.length < 10;) {
            let random = Math.ceil(Math.random() * result[result.length - 1].id);
            for (let i = 0; i < result.length; i++) {
                if (random === result[i].id) {
                    num.push(random)
                }
            }
        }
        // 查询 轮播图
        let mysql = `SELECT id,goods_name,image,price FROM bl_goods  WHERE id IN (${num})`;
        db.query(mysql, (error, data) => {
            if (error) return res.json({
                "code": 400,
                "error": error
            })
            data.forEach(e => {
                // 商品 封面
                e.image = `http://${config.server.ip}:${config.server.port}/${e.image}`;
            });

            res.json({
                "code": 200,
                data
            })
        })
    })
})

// 导出路由
module.exports = router;