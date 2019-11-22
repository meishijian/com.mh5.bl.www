// 导入 express
const express = require('express');
// 导入路由
const router = express.Router();
const jsonwebtoken = require("jsonwebtoken");
const config = require("../config");
// 导入 二、db数据库文件
const db = require('../db');
const fileBaseUrl = "http://192.168.86.129:9494/api/v1/public/image/";
// 商品
router.get("/goods_list", (req, res) => {
    // 分类id
    let cat_id = req.query.id;
    // console.log(cat_id);   
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
    // 翻页
    const offset = (page - 1) * per_page;
    // // console.log(offset);
    // limit
    const limit = ` LIMIT ${offset},${per_page}`;

    let mysql = "SELECT count(*) total FROM bl_goods WHERE cat_id= ?";
    db.query(mysql, cat_id, (error, data) => {
        let mysql = `SELECT id,goods_name,price,image,service FROM bl_goods ${where}`
        // console.log(mysql);
        db.query(mysql, (error, result) => {
            // result.forEach(element => {
            //     element.image = fileBaseUrl + element.image
            // });
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
    let goods_name = req.query.goods_name;
    // console.log(goods_name);

    // if()
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
    // console.log(volume);

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
    // console.log(mysql);

    db.query(mysql, (error, result) => {
        // console.log(result);
        // result.forEach(element => {
        //     element.image = fileBaseUrl + element.image
        // });
        // console.log(result);

        res.json({
            "code": 200,
            "data": result
        })
    })


})

// 商品 点击每一个商品就入每一个商品详情页
router.get('/goods_detail', (req, res) => {
    let id = req.query.id;
    // console.log(id);
    let mysql = "SELECT a.id,a.goods_name,a.price,a.image,a.service,a.pic_details,b.id bra_id, b.bra_name,b.bra_image FROM bl_brand b,bl_goods a WHERE a.brand_id = b.id AND  a.id = ?"
    db.query(mysql, id, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error
        })
        res.json({
            "code": 200,
            "data": result[0]
        })
    })
})

// 热门搜索
router.get("/popular_search", (req, res) => {
    // console.log(11);

    let mysql = "SELECT count(*) c FROM bl_sort";
    db.query(mysql, (error, result) => {
        let num = [];
        for (let i = 0; i < 10; i++) {
            num.push(Math.floor(Math.random() * result[0].c))
        }
        // 查询 轮播图
        let mysql = `SELECT id,sort_name FROM bl_sort WHERE id IN (${num})`;
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

// 店铺热门 
router.get("/goods_hot_shop", (req, res) => {
    let brand_id = req.query.brand_id;
    if (!brand_id) {
        return res.json({
            "code": 400,
            "error": "店铺ID为空"
        })
    }

    // console.log(brand_id);
    let mysql = "SELECT count(*) c FROM bl_goods WHERE brand_id = ?";
    db.query(mysql, brand_id, (error, result) => {
        let num = [];
        for (let i = 0; i < 3; i++) {
            num.push(Math.floor(Math.random() * result[0].c))
        }
        // 查询 
        let mysql = `SELECT id,goods_name,price,image FROM bl_goods WHERE id IN (${num})`;
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

// 下订单
router.post("/orders", (req, res) => {

    /**  
     * 大体步骤
     * 1、令牌
     * 2、解析令牌  拿到相应的数据
     * 3、接收页面上的数据 
     *    3.1.判断参数验证 收货人的ID
     *    3.2.判断 数据库 的 商品数量 是否足够    
     * 4、商品 数据库的库存量 是否 充足 
     * 5、创建订单信息  需要向别的表中取数据
     * 6、添加订单商品 数据 有可能 添加 不止一项，所以循环 页面提交的 数据数量 提交成功最好别返回数据 因为是一个 for 循环 如果有返回值 可能会出现 '发送到客户端后无法设置头'  这个和 修改 商品 库存量最好不要在一个 循环中 有可能会出现 报错现在
     * 7、修改 商品 库存量 有可能 修改 不止一项，所以循环 页面提交的 数据数量 提交成功最好别返回数据 因为是一个 for 循环 如果有返回值 可能会出现 '发送到客户端后无法设置头'  这个和 添加订单商品最好不要在一个 循环中 有可能会出现 报错现在
     */

    // console.log(req.body);
    // 第一步 先把 接收 用户的ID  但是用户ID 在令牌中 那么要从令牌中拿取
    // 取令牌的话， 那就要在 headers 协议中取 

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
            // console.log(decoded);
            // 获取页面上的数据 收货地址 id
            let address_id = req.body.address_id;
            // 数据 
            /** 
"cart":[
{
"goods_id":5,
"buy_count":10
},
{
"goods_id":6,
"buy_count":30
}
]
*/
            let cart = req.body.cart;

            // 为了安全 判断收货人的ID 是否正确
            //    以 ^：以数字开头
            //    以 $：以数字结尾 
            let numRe = /^\d+$/;
            // 验证 取反
            if (!numRe.test(address_id)) {
                return res.json({
                    "code": 400,
                    "error": "无效的收货人地址!"
                })
            }

            // 查询 数据库 的 商品数量 是否足够
            // 先把 商品 id拿到  查询 相关的商品
            let goodsIds = [];
            cart.forEach(item => {
                goodsIds.push(item.goods_id);
            });
            // 但是现在数据 是数组 需要的是 字符串
            goodsIds = goodsIds.join(",");

            // 查询 这几个商品中的 数据 比如 库存量
            let mysql = `SELECT id,stock,
                                price,
                                goods_name,
                                image goods_image
                                FROM bl_goods WHERE id in (${goodsIds})`

            db.query(mysql, (error, result) => {
                // console.log(result);
                // 把查询到的 数据 存储起来 方便 使用
                let goodsData = result;
                let totalePrice = 0;
                // 判断 数据库得 数量是否 和 前端数据一致 但是 少了一个 条件 id 必须一致
                // 循环数据库中查询出来的库存量
                for (let i = 0; i < result.length; i++) {
                    // 根据商品的ID到购物车中找出相应的商品
                    let goods = cart.find(v => {
                        return v.goods_id === result[i].id
                    })
                    // console.log(goods);
                    // 判断 购买得数量 大于 数据库得数量 那么 返回数据库数量不足
                    if (goods.buy_count > result[i].stock) {
                        return res.json({
                            'code': 400,
                            'error': '商品库存量不足！'
                        })
                    }
                    // console.log(goods);
                    // console.log(result[i]);
                    // 用数据的 商品价格 乘以 购买的数量
                    totalePrice += goods.buy_count * result[i].price
                }

                // 创建订单数据 时 需要 收货人信息 需要查询数据库 那根据 传过来得 收货地址得 id 进行查询
                let mysql = `SELECT shr_name,
                                    mobile shr_mobile,
                                    province shr_province,
                                    city shr_city,
                                    area shr_area,
                                    address shr_address
                            FROM bl_address WHERE id=?`;

                db.query(mysql, address_id, (error, result) => {
                    // console.log(result);
                    if (error) return res.json({ "code": 400, "error": error });
                    // 查询到 空数据时
                    if (result.length == 0) {
                        return res.json({ "code": 400, "error": "收货地址 ID 不正确" })
                    }
                    // 定义 订单号  由 当前时间 + 随机数 7
                    let sn = new Date().getTime().toString() + parseInt(Math.random() * 10000000);
                    // 如果到了这里代表 可以提交订单了
                    let orderData = {
                        user_id: decoded.id, // 从令牌中解析出了用户ID
                        status: 0, // 下单状态， 默认0 ：未支付
                        addtime: parseInt(new Date().getTime() / 1000), // 当前时间戳
                        order_sn: sn, // 订单号：1.唯一   2.没有规律 
                        ...result[0],  // 需要 收货地址相关信息 那就查询收货地址信息表
                        total_price: totalePrice // 商品的总价格
                    }
                    // 把订单信息 放入到 订单表中
                    let mysql = "INSERT INTO bl_orders SET ?"
                    db.query(mysql, orderData, (error, result) => {
                        if (error) return res.json({
                            "code": 400,
                            "error": error
                        })

                        // 订单信息 添加完成后  添加订单商品 表信息
                        // 订单商品表 信息添加
                        // 因为 有可能添加不止一条信息，所以现在 需要循环一下 页面提交了多少条信息
                        for (let i = 0; i < cart.length; i++) {
                            // 根据 商品id 查询页面的数据 商品ID 是否一致 一致返回数据
                            let goodsInfo = goodsData.find(v => {
                                return v.id === cart[i].goods_id
                            })
                            // console.log(goodsInfo);
                            // 订单商品数据信息
                            let orderGoodsData = {
                                goods_id: cart[i].goods_id,  // 商品ID
                                buy_count: cart[i].buy_count, // 购买的数量
                                order_id: result.insertId, // 订单的ID 添加数据时 会返回添加的ID
                                price: goodsInfo.price, // 现在需要 商品的价格 那么获取 数据库的信息
                                goods_name: goodsInfo.goods_name, // 现在需要 商品的名称 那么获取 数据库的信息
                                goods_image: goodsInfo.goods_image, // 现在需要 商品的图片路径 那么获取 数据库的信息
                            }

                            let mysql = "INSERT INTO bl_order_goods SET ?";
                            db.query(mysql, orderGoodsData, (error, result) => {
                                if (error) return res.json({
                                    "code": 400,
                                    "error": error
                                })
                            })
                        }

                        // 添加成功 订单商品数据信息 那么修改 商品的库存
                        // 修改 商品表中的 库存量 
                        // 因为 有可能删除的不止一条信息，所以现在 需要循环一下 页面提交了多少条信息
                        for (let i = 0; i < cart.length; i++) {
                            // 根据 商品id 查询页面的数据 商品ID 是否一致 一致返回数据
                            let goodsStock = goodsData.find(v => {
                                return v.id === cart[i].goods_id
                            })
                            // console.log(goodsStock);
                            // console.log(cart[i]);

                            let stockNum = {
                                stock: goodsStock.stock - cart[i].buy_count
                            };

                            let mysql = `UPDATE bl_goods SET ? WHERE id = ${goodsStock.id}`;
                            db.query(mysql, stockNum, (error, result) => {
                                if (error) return res.json({
                                    "code": 400,
                                    "error": error
                                })
                            })
                        }
                        res.json({
                            "code": 200
                        })
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

// 商品 点击每一个商品就入每一个商品详情页
router.get('/goods_details', (req, res) => {
    let id = req.query.id;
    // console.log(id);
    let mysql = "SELECT a.id,a.goods_name,a.price,a.image,a.service,a.pic_details,a.goods_pic,b.id bra_id, b.bra_name,b.bra_image FROM bl_brand b,bl_goods a WHERE a.brand_id = b.id AND  a.id = ?"
    db.query(mysql, id, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error
        })
        let pic = result[0].goods_pic.split(",");
        pic.forEach((element, index) => {
            pic[index] = fileBaseUrl + element
        });
        result[0].goods_pic = pic;
        // console.log(result[0].goods_pic);
        res.json({
            "code": 200,
            "data": result[0]
        })
    })
})


// 购物车获取商品
router.get("/cart_goods", (req, res) => {
    let goods_id = req.query.goods_id;
    // console.log(goods_id.join(","));
    // console.log(goods_id);

    if (!goods_id) {
        return res.json({
            "code": 400,
            "error": "参数不能为空"
        })
    }
    let mysql = `SELECT id,goods_name,price,image,service FROM bl_goods WHERE id in (${goods_id})`;
    db.query(mysql, (error, result) => {
        if (error) return res.json({
            "code": 400,
            "error": error
        });
        res.json({
            "code": 200,
            "data": result
        })
    })

})

// 导出路由
module.exports = router;