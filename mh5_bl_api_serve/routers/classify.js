// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 全体配置文件
const config = require('../config');
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

// 查询所有分类
router.get("/goods_classify", (req, res) => {
    // 【可选】 页数
    const page = req.query.pagenum || 1;
    // 【可选】 一条多少数据
    const pagesize = req.query.pagesize;

    // 【可选】 排序 升序 或 降序
    const sortway = req.query.sortway || 'asc';
    // 根据查询参数拼 SQL 语句
    // 定义拼接 变量
    // let where = '';
    // let ar_where = '';
    // // 存放数据
    // let data = [];
    // // 判断 用户名
    // if (title) {
    //     // 判断
    //     where = `WHERE title like ?`;
    //     ar_where = `AND b.title like ?`;
    //     // 把数据放到 data中
    //     data[0] = `%${title}%`;
    // }
    // 排序
    const order = ` ORDER BY id ${sortway}`;
    // limit
    let limit = '';
    if (pagesize !== undefined) {
        // 翻页
        let offset = (page - 1) * pagesize;
        // limit
        limit = ` LIMIT ${offset},${pagesize}`;
    }
    // mysql
    let mysql = `SELECT COUNT(*) total FROM bl_classify`;
    db.query(mysql, (error, results) => {
        // 判断
        if (error) return res.json(error);
        // 总条数据
        let total = results[0].total;
        // 获取文章 数据 
        mysql = `SELECT * FROM bl_classify ${order} ${limit}`;
        db.query(mysql, (error, result2) => {
            // 判断
            if (error) return res.json(error);
            // 获取文章 数据 
            let mysql = 'SELECT id,class_id,cat_title cla_name FROM bl_categories';
            db.query(mysql, (error, result) => {
                let mysql = 'SELECT b.* FROM bl_sort b left join  bl_categories a  ON a.id = b.cat_id';
                db.query(mysql, (error, result1) => {

                    // part f分类层级  // 0 一级 1 二级  2 三级 
                    result2.forEach((element2, index2) => {
                        let data_Data = [];
                        result.forEach((element, index) => {
                            let data = [];
                            result1.forEach((element1, index1) => {
                                // console.log(element);
                                if (element.id == element1.cat_id) {
                                    data.push({
                                        id: element1.id,
                                        cla_name: element1.sort_name,
                                        sort_image: element1.sort_image.indexOf("https://") != -1 ? element1.sort_image : `http://${config.server.ip}:${config.server.port}/${element1.sort_image}`,
                                        part: "2"
                                    });
                                }
                            });
                            result[index].part = "1";
                            result[index].children = data;
                            if (element2.id == element.class_id) {
                                data_Data.push(result[index]);
                            }
                        });
                        result2[index2].part = "0";
                        result2[index2].children = data_Data;

                    });

                    res.json({
                        "code": 200,
                        total,
                        "data": result2
                    })
                })
            });
        })
    })
})

// 获取 第一级 第二级
router.get("/goods_one_two", (req, res) => {
    let mysql = `SELECT * FROM bl_classify`;
    db.query(mysql, (error, result2) => {
        // 判断
        if (error) return res.json(error);
        // 获取文章 数据 
        let mysql = 'SELECT id,class_id,cat_title cla_name FROM bl_categories';
        db.query(mysql, (error, result) => {

            result2.forEach((element2, index2) => {
                let data_Data = [];
                result.forEach((element, index) => {
                    if (element2.id == element.class_id) {
                        data_Data.push(result[index]);
                    }
                });
                result2[index2].children = data_Data;

            });

            res.json({
                "code": 200,
                "data": result2
            })
        });
    })
})

// 添加一级分类
router.post("/goods_classify_one", (req, res) => {
    let cla_name = req.body.cla_name;
    if (cla_name === undefined) {
        return res.json({
            'code': 400,
            'error': '分类名称不能为空!'
        })
    }
    // mysql
    let mysql = `INSERT INTO bl_classify SET ?`;
    db.query(mysql, req.body, (error, result) => {
        // 判断
        if (error) return res.json(error);

        res.json({
            'code': 200,
            'message': "添加分类成功"
        })
    })
})

// 添加二级分类
router.post("/goods_classify_two", (req, res) => {
    let class_id = req.body.class_id;
    let cat_title = req.body.cat_title;
    if (class_id === undefined) {
        return res.json({
            'code': 400,
            'error': '父ID不能为空!'
        })
    }
    if (cat_title === undefined) {
        return res.json({
            'code': 400,
            'error': '分类名称不能为空!'
        })
    }
    // 把数据放到 data 中 ，这样好操作数据 
    let dataStr = {
        class_id,
        cat_title
    };
    // mysql
    let mysql = `INSERT INTO bl_categories SET ?`;
    db.query(mysql, dataStr, (error, result) => {
        // 判断
        if (error) return res.json(error);

        res.json({
            'code': 200,
            'message': "添加分类成功"
        })
    })
})

// 添加三级分类
router.post("/goods_classify_three", (req, res) => {
    let cat_id = req.body.cat_id;
    let sort_name = req.body.sort_name;
    let sort_image = req.body.sort_image;
    if (cat_id === undefined) {
        return res.json({
            'code': 400,
            'error': '父ID不能为空!'
        })
    }
    if (sort_name === undefined) {
        return res.json({
            'code': 400,
            'error': '分类名称不能为空!'
        })
    }
    if (sort_image === undefined) {
        return res.json({
            'code': 400,
            'error': '分类图片不能为空!'
        })
    }
    // 把数据放到 data 中 ，这样好操作数据 
    let dataStr = {
        cat_id,
        sort_name,
        sort_image
    };
    // mysql
    let mysql = `INSERT INTO bl_sort SET ?`;
    db.query(mysql, dataStr, (error, result) => {
        // 判断
        if (error) return res.json(error);

        res.json({
            'code': 200,
            'message': "添加分类成功"
        })
    })
})

// 回显各级分类
router.get('/goods_classify/:id(\\d+)', (req, res) => {
    let part = req.query.part; // 0 一级 1 二级  2 三级 
    // 获取分类ID
    let id = req.params.id;
    // 分类ID 没有传时
    if (!id) {
        return res.json({
            "code": 400,
            "error": "分类ID不能为空"
        });
    }
    // 查询 该 分类ID
    // mysql
    let mysql = "";
    if (part === "0") {
        mysql = "SELECT * FROM bl_classify WHERE id = ?";
    } else if (part === "1") {
        mysql = "SELECT * FROM bl_categories WHERE id = ?";
    } else if (part === "2") {
        mysql = "SELECT * FROM bl_sort WHERE id = ?";
    } else {
        return res.json({
            'code': 400,
            'error': '类型不能为空!'
        })
    }
    db.query(mysql, id, (error, result) => {
        // 判断
        if (error) return res.json(error);

        // 如果不存在 该ID
        if (result.length === 0) {
            return res.json({
                "code": 400,
                "error": "分类ID错误"
            });
        }
        // 成功时
        res.json({
            "code": 200,
            "data": result[0]
        })
    })
})

// 修改各级分类
router.put("/goods_classify", (req, res) => {
    let part = req.body.part; // 0 一级 1 二级  2 三级 

    // 获取分类ID
    let id = req.body.id;
    // 获取分类 名称
    let cla_name = req.body.cla_name;

    if (cla_name === undefined) {
        return res.json({
            'code': 400,
            'error': '分类名称不能为空!'
        })
    }
    // mysql
    let mysql = "";
    if (part === "0") {
        mysql = "SELECT * FROM bl_classify WHERE id = ?";
    } else if (part === "1") {
        mysql = "SELECT * FROM bl_categories WHERE id = ?";
    } else if (part === "2") {
        mysql = "SELECT * FROM bl_sort WHERE id = ?";
    } else {
        return res.json({
            'code': 400,
            'error': '类型不能为空!'
        })
    }
    db.query(mysql, id, (error, result) => {
        // 判断
        if (error) return res.json(error);

        // 如果不存在 该ID
        if (result.length === 0) {
            return res.json({
                "code": 400,
                "error": "不存在该分类"
            });
        }

        // 进行修改 编辑
        if (part === "0") {
            mysql = "UPDATE bl_classify SET cla_name = ? WHERE id = ?";
        } else if (part === "1") {
            mysql = `UPDATE bl_categories SET cat_title = ?,class_id='${req.body.class_id}' WHERE id = ?`;
        } else if (part === "2") {
            mysql = `UPDATE bl_sort SET sort_name = ?,sort_image='${req.body.sort_image}',cat_id='${req.body.cat_id}' WHERE id = ?`;
        } else {
            return res.json({
                'code': 400,
                'error': '类型不能为空!'
            })
        }


        db.query(mysql, [cla_name, id], (error, result) => {
            // 判断
            if (error) return res.json(error);

            // 修改编辑 成功
            res.json({
                "code": 200,
                "message": "修改分类成功"
            });
        })
    })

})

// 删除各级分类
router.delete("/goods_classify/:id(\\d+)", (req, res) => {
    let part = req.query.part; // 0 一级 1 二级  2 三级 
    // console.log(part);

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
    let mysql = "";
    if (part === "0") {
        mysql = "SELECT * FROM bl_classify WHERE id = ?";
        db.query(mysql, id, (error, result) => {
            // 判断
            if (error) return res.json(error);

            // console.log(result[0].id);
            if (result.length === 0) {
                return res.json({
                    'code': 400,
                    "error": "ID不正确"
                })
            }
            // 定义 id
            let strID = result[0].id;

            mysql = "SELECT * FROM bl_categories WHERE class_id = ?";
            db.query(mysql, strID, (error, result2) => {
                // 判断
                if (error) return res.json(error);
                // console.log(result2[0].id);
                if (result2.length === 0) {
                    // 进行删除 
                    mysql = `DELETE FROM bl_classify WHERE id = ${strID}`;
                    db.query(mysql, (error, resuly) => {
                        // 判断
                        if (error) return res.json(error);
                        res.json({
                            "code": 200,
                            "message": "删除成功"
                        });
                    })
                } else {
                    // 定义 id
                    let strID2 = result2[0].id || "";

                    mysql = `SELECT * FROM bl_sort WHERE cat_id  in ( ${strID2} )`;
                    db.query(mysql, (error, result3) => {
                        // 判断
                        if (error) return res.json(error)

                        if (result3.length === 0) {
                            // 进行删除 
                            mysql = `DELETE FROM bl_classify WHERE id = ${strID}`;
                            db.query(mysql, (error, resuly) => {
                                // 判断
                                if (error) return res.json(error);
                                // 二级
                                mysql = `DELETE FROM bl_categories WHERE class_id in ( ${strID} )`;
                                db.query(mysql, (error, resuly) => {
                                    // 判断
                                    if (error) return res.json(error);
                                    res.json({
                                        "code": 200,
                                        "message": "删除成功"
                                    });
                                })
                            })
                        } else {
                            // 进行删除 
                            mysql = `DELETE FROM bl_classify WHERE id = ${strID}`;
                            db.query(mysql, (error, resuly) => {
                                // 判断
                                if (error) return res.json(error);
                                // 二级
                                mysql = `DELETE FROM bl_categories WHERE class_id in ( ${strID} )`;
                                db.query(mysql, (error, resuly) => {
                                    // 判断
                                    if (error) return res.json(error);
                                    // 三级
                                    mysql = `DELETE FROM bl_sort WHERE cat_id in ( ${strID2} )`;
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
                        }
                    })

                }

            })
        })

    } else if (part === "1") {
        mysql = "SELECT * FROM bl_categories WHERE id = ?";
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
            // 定义 id
            let strID2 = result2[0].id || "";
            // 进行删除   
            // 二级
            mysql = `DELETE FROM bl_categories WHERE id in ( ${id} )`;
            db.query(mysql, (error, resuly) => {
                // 判断
                if (error) return res.json(error);
                // 三级
                mysql = `DELETE FROM bl_sort WHERE cat_id in ( ${strID2} )`;
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

    } else if (part === "2") {
        mysql = "SELECT * FROM bl_sort WHERE id = ?";
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
            mysql = `DELETE FROM bl_sort WHERE id in ( ${id} )`;
            db.query(mysql, (error, resuly) => {
                // 判断
                if (error) return res.json(error);

                res.json({
                    "code": 200,
                    "message": "删除成功"
                });
            })
        })
    } else {
        return res.json({
            'code': 400,
            'error': '类型不能为空!'
        })
    }
})



// 导出路由
module.exports = router;