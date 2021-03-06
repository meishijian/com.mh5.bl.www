// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
// 导入 二、db数据库文件
const db = require('../db');
// 导入 三、md5加密包
const md5 = require('md5');
// 导入 jsonwebtoken
const jsonwebtoken = require('jsonwebtoken');
// 导入 全体配置文件
const config = require('../config');

// 注册
router.post("/regist", (req, res) => {
    let mobile = req.body.mobile;
    let password = req.body.password;
    // 设置 body-parser
    // 然后判断 用户名 也是手机号
    let mobileRe = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if (!(mobileRe.test(mobile))) {
        return res.json({
            "code": 400,
            "error": "手机号码格式不正确!"
        })
    }
    // 判断 密码
    let passwordRe = /^[0-9a-zA-Z_]{6,18}$/;
    if (!(passwordRe.test(password))) {
        return res.json({
            "code": 400,
            "error": "密码必须是6~18位的数字、字母、下划线!"
        })
    }
    // 查询 用户名 手机号是否存在
    let mysql = "SELECT COUNT(*) c FROM bl_users where mobile=?";
    db.query(mysql, mobile, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error.message
        })
        // 判断 手机号是否存在
        if (result[0].c > 0) {
            return res.json({
                "code": 400,
                "error": "手机号已存在!"
            })
        }
        mysql = "INSERT INTO bl_users SET ?";
        let data = {
            mobile,
            password: md5(password + config.md5),
            regtime: new Date().getTime().toString().substring(0, 10),
            face: "70.jpg",
            nickname: mobile
        }

        db.query(mysql, data, (error, result) => {
            if (error) return res.json({
                "code": 400,
                "error": error.message
            })
            res.json({
                "code": 200,
                "message": "注册成功"
            })
        })
    })
})

// 登录
router.post("/login", (req, res) => {
    let mobile = req.body.mobile;
    let password = req.body.password;
    // 设置 body-parser
    // 然后判断 用户名 也是手机号
    let mobileRe = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if (!(mobileRe.test(mobile))) {
        return res.json({
            "code": 400,
            "error": "手机号码格式不正确!"
        })
    }
    // 判断 密码
    let passwordRe = /^[0-9a-zA-Z_]{6,18}$/;
    if (!(passwordRe.test(password))) {
        return res.json({
            "code": 400,
            "error": "密码必须是6~18位的数字、字母、下划线!"
        })
    }

    // 查询 用户名 手机号是否存在
    let mysql = "SELECT id,password FROM bl_users where mobile=?";
    db.query(mysql, mobile, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error.message
        })
        // 判断用户名是否存在
        if (!result[0]) {
            return res.json({
                "code": 400,
                "error": "用户名不存在!"
            })
        }
        // 判断密码 
        if (md5(password + config.md5) !== result[0].password) {
            return res.json({
                "code": 400,
                "error": "密码错误!"
            })

        }
        // <3>、如果一致 生成令牌 那需要 jsonwebtoken
        const token = jsonwebtoken.sign({
            id: result[0].id
        }, config.jwt.key, { expiresIn: config.jwt.expire });

        res.json({
            "code": 200,
            token
        })
    })
})


// 注册 店铺
router.post("/regist_brand", (req, res) => {
    // 设置 body-parser
    // 也是手机号
    let mobile = req.body.mobile;
    // 然后判断 用户名 也是手机号
    let mobileRe = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if (!(mobileRe.test(mobile))) {
        return res.json({
            "code": 400,
            "error": "手机号码格式不正确!"
        })
    }
    // 密码
    let password = req.body.password;
    // 判断 密码
    let passwordRe = /^[0-9a-zA-Z_]{6,18}$/;
    if (!(passwordRe.test(password))) {
        return res.json({
            "code": 400,
            "error": "密码必须是6~18位的数字、字母、下划线!"
        })
    }
    // 店铺名称
    let bra_name = req.body.bra_name;
    if (bra_name === undefined) {
        return res.json({
            'code': 400,
            'error': '店铺名称不能为空!'
        })
    }
    // 店铺图标
    let bra_image = req.body.bra_image;
    if (bra_image === undefined) {
        return res.json({
            'code': 400,
            'error': '店铺图标不能为空!'
        })
    }

    // 查询 用户名 手机号是否存在
    let mysql = "SELECT COUNT(*) count FROM bl_brand where mobile=?";
    db.query(mysql, mobile, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error.message
        })
        // 判断 手机号是否存在
        if (result[0].count > 0) {
            return res.json({
                "code": 400,
                "error": "手机号已存在!"
            })
        }
        mysql = "INSERT INTO bl_brand SET ?";
        let data = {
            mobile,
            password: md5(password + config.md5),
            bra_name,
            bra_image,
            regtime: new Date().getTime().toString().substring(0, 10),
        }

        db.query(mysql, data, (error, result) => {
            if (error) return res.json({
                "code": 400,
                "error": error.message
            })
            res.json({
                "code": 200,
                "message": "注册成功"
            })
        })
    })
})

// 登录
router.post("/login_brand", (req, res) => {
    let mobile = req.body.mobile;
    let password = req.body.password;
    // 设置 body-parser
    // 然后判断 用户名 也是手机号
    let mobileRe = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
    if (!(mobileRe.test(mobile))) {
        return res.json({
            "code": 400,
            "error": "手机号码格式不正确!"
        })
    }
    // 判断 密码
    let passwordRe = /^[0-9a-zA-Z_]{6,18}$/;
    if (!(passwordRe.test(password))) {
        return res.json({
            "code": 400,
            "error": "密码必须是6~18位的数字、字母、下划线!"
        })
    }

    // 查询 用户名 手机号是否存在
    let mysql = "SELECT id,password FROM bl_users where mobile=?";
    db.query(mysql, mobile, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error.message
        })
        // 判断用户名是否存在
        if (!result[0]) {
            return res.json({
                "code": 400,
                "error": "用户名不存在!"
            })
        }
        // 判断密码 
        if (md5(password + config.md5) !== result[0].password) {
            return res.json({
                "code": 400,
                "error": "密码错误!"
            })

        }
        // <3>、如果一致 生成令牌 那需要 jsonwebtoken
        const token = jsonwebtoken.sign({
            id: result[0].id
        }, config.jwt.key, { expiresIn: config.jwt.expire });

        res.json({
            "code": 200,
            token
        })
    })
})

// 导出路由
module.exports = router;