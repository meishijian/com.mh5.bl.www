// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
const jsonwebtoken = require("jsonwebtoken");
const config = require("../config");
// 导入 二、db数据库文件
const db = require('../db');

// 获取所有的地址
router.get("/address_all", (req, res) => {
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
            let mysql = "SELECT id,shr_name name,mobile tel,province,city,area,address,isdefault FROM bl_address WHERE user_id = ?"
            db.query(mysql, decoded.id, (error, result) => {
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })

                res.json({
                    "code": 200,
                    "data": result
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

// 添加地址
router.post("/received_address", (req, res) => {
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
            // { id: 1, iat: 1574257880, exp: 1574301080 }
            // 收货人
            let shr_name = req.body.shr_name;
            // 收货人 
            if (!shr_name) {
                return res.json({
                    "code": 400,
                    "error": "姓名参数不能为空!"
                })
            }
            // 收货手机号
            let mobile = parseInt(req.body.mobile);
            // console.log(mobile);

            // 然后判断 用户名 也是手机号
            let mobileRe = /^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
            if (!mobileRe.test(mobile)) {
                return res.json({
                    "code": 400,
                    "error": "手机号码格式不正确!"
                })
            }
            // 省
            let province = req.body.province;
            if (!province) {
                return res.json({
                    "code": 400,
                    "error": "省参数不能为空!"
                })
            }
            // 市
            // let city = req.body.city;
            // if (!city) {
            //     return res.json({
            //         "code": 400,
            //         "error": "市参数不能为空!"
            //     })
            // }
            // 区
            let area = req.body.area;
            if (!area) {
                return res.json({
                    "code": 400,
                    "error": "区参数不能为空!"
                })
            }
            // 详细地址
            let address = req.body.address;
            if (!address) {
                return res.json({
                    "code": 400,
                    "error": "详细地址参数不能为空!"
                })
            }
            // // 是否默认  0不默认  1默认
            let isdefault = parseInt(req.body.isdefault);
            let dataBody = req.body;
            dataBody.user_id = decoded.id;

            // let mql = `SELECT * WHERE user_id = ${decoded.id} AND isdefault = 1`;

            let mysql = "INSERT INTO bl_address SET ?"
            db.query(mysql, dataBody, (error, result) => {
                // console.log(result);
                if (error) return res.json({
                    "code": 400,
                    "error": error
                })
                res.json({
                    "code": 200,
                    "data": "地址添加成功"
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