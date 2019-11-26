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
// 导入 全体配置文件
const config = require('../config');
// 导入 jsonwebtoken
const jsonwebtoken = require('jsonwebtoken');

// 保存 图片路径 地址  
const picAddress = "../public/image/";
//  访问 服务器中的图片 路径  前端使用的图片路径是 服务器的路径图片地址
const fileBaseUrl = "http://127.0.0.1:9494/api/v1/public/image/";
// git@github.com:meishijian/com.mh5.bl.www.git
// 用户信息渲染
router.get("/users", (req, res) => {

    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);

            let mysql = "SELECT id,nickname,face,integral FROM bl_users WHERE id = ?";
            db.query(mysql, decoded.id, (error, result) => {
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })
                result[0].face = fileBaseUrl + result[0].face;

                res.json({
                    "code": 200,
                    "data": result[0]
                })
            })
        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})

// 订单管理
router.get("/order_status", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let mysql = `SELECT id,status FROM bl_orders WHERE user_id = ${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })
                // 待付款 
                let payment = 0;
                // 待收货
                let receiving = 0;
                // 待评价
                let evaluate = 0;
                // 待售后
                let sale = 0;
                result.forEach(element => {
                    if (element.status == 0) {
                        payment++;
                    } else if (element.status == 2) {
                        receiving++
                    } else if (element.status == 3) {
                        evaluate++;
                    } else if (element.status == 4) {
                        sale++;
                    }
                });

                res.json({
                    "code": 200,
                    "data": {
                        payment,
                        receiving,
                        evaluate,
                        sale
                    }
                })
            })

        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})


// 上传头像
router.post("/user_pic_upload", multer().single("pic"), (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            // console.log(req.file);
            fs.writeFileSync(path.join(__dirname, picAddress + req.file.originalname), req.file.buffer);
            // 
            // console.log(req.file.originalname);
            // 图片名称
            let face = req.file.originalname;

            let mysql = `UPDATE bl_users SET face='${face}' WHERE  id = ${decoded.id} `;
            db.query(mysql, (error, result) => {
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })
                // 写入成功
                res.json({
                    "code": 200,
                    "url": fileBaseUrl + face
                })
            })
        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }

})

// 发送 本地 图片
router.get("/public/image/*", (req, res) => {
    let imgName = req.params[0]
    res.sendFile(path.join(__dirname, picAddress + imgName))

})

// 设置用户显示信息
router.get("/user_display_all", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let mysql = `SELECT id,nickname,face,sex,birth,preference FROM bl_users WHERE id= ${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })
                result[0].face = fileBaseUrl + result[0].face;
                if (result[0].sex == null) {
                    result[0].sex = ''
                } else if (result[0].sex == 0) {
                    result[0].sex = '保密'
                } else if (result[0].sex == 1) {
                    result[0].sex = '男'
                } else if (result[0].sex == 2) {
                    result[0].sex = '女'
                }
                // console.log(result[0]);
                res.json({
                    "code": 200,
                    "data": result[0]
                })
            })
        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})

// 回显 用户昵称
router.get("/user_echo_nickname", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let mysql = `SELECT id,nickname FROM bl_users WHERE id= ${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) res.json({
                    "code": 400,
                    "error": error
                })

                res.json({
                    "code": 200,
                    "data": result[0]
                })
            })

        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})
// 修改 用户昵称
router.put("/user_modify_nickname", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let nickname = req.body.nickname;
            let mysql = `UPDATE bl_users SET nickname= '${nickname}' WHERE id=${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) res.json({
                    "code": 400,
                    "error": error
                })

                res.json({
                    "code": 200,
                    "message": "修改昵称成功!"
                })
            })

        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})
// 修改 性别
router.put("/user_modify_sex", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let sex = req.body.sex;
            let mysql = `UPDATE bl_users SET sex= '${sex}' WHERE id=${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) res.json({
                    "code": 400,
                    "error": error
                })

                res.json({
                    "code": 200,
                    "message": "修改性别成功!"
                })
            })

        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})
// 修改 出生日期
router.put("/user_modify_birth", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let birth = req.body.birth;
            let mysql = `UPDATE bl_users SET birth= '${birth}' WHERE id=${decoded.id}`;
            db.query(mysql, (error, result) => {
                if (error) res.json({
                    "code": 400,
                    "error": error
                })

                res.json({
                    "code": 200,
                    "message": "修改出生日期成功!"
                })
            })

        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})
// 修改 偏好
router.put("/user_modify_pre", (req, res) => {
    // 获取令牌
    let token = req.headers.authorization;
    // console.log(token);

    // 判断有没有令牌  没有令牌的话 返回 令牌不存在
    if (token === undefined) {
        return res.json({
            "code": 400,
            "error": "令牌不存在!"
        })
    } else {
        // 如果令牌存在  那么就解析令牌 解析令牌的时候自己会判断 不会写的话，去npm里查询 jsonwebtoken  因为现在解析的是 令牌
        // invalid token - synchronous
        try {
            // 先截取 token 字符串 因为添加 token 的时候 我们 自己 多加了 7个字符
            token = token.substring(7);
            // console.log(token);

            // 如果解析失败 就会错误， 解析成功 就会把之前放的数据 解析出来 用户ID
            let decoded = jsonwebtoken.verify(token, config.jwt.key);
            // console.log(decoded.id);
            let claId = req.body.claId;

            let mysql = `SELECT * FROM bl_classify WHERE id in (${claId})`;
            db.query(mysql, (error, result) => {
                if (error) res.json({
                    "code": 400,
                    "error": error
                })
                // console.log(result);
                let data = []
                result.forEach(element => {
                    data.push(element.cla_name);
                });
                let mysql = `UPDATE bl_users SET preference= '${data.join(",")}' WHERE id=${decoded.id}`;
                db.query(mysql, (error, result) => {
                    if (error) res.json({
                        "code": 400,
                        "error": error
                    })

                    res.json({
                        "code": 200,
                        "message": "修改偏好成功!"
                    })
                })
            })


        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
})

// 导出路由
module.exports = router;