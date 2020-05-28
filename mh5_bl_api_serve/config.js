module.exports = {
    // 启动服务器时使用的端口 和 IP
    server: {
        // 启动服务器端口号
        // port: 3336,
        port: 45567,
        // IP
        ip: '0.0.0.0'
        // port: 59885,
        // ip: '39.96.36.108'
        // ip: '127.0.0.1'
    },
    // 令牌
    jwt: {
        // 令牌秘钥
        key: 'asdfdgfdhfgjhghkjhgkjheGHJKLKJhbnFBfbnkjBJkhjvbnBnlHNjkhjBvbjjhvBNbnBNkjvhjBNLjkvbnklkhCJHBKKvhbJHGCgvjghCGCVCJhkghgVJBHGJchvhJHGJJHcvhjhGJ',
        // 过期时间
        expire: '9999999999999999999999999999999999999999999999999999'
    },
    // 数据库
    db: {
        // 主机 ip
        host: 'localhost',
        // 数据库端口
        port: 3306,
        // 数据库名
        user: 'root',
        // 数据库密码
        password: 'root',
        // 连接数据库的 数据库 表名
        database: 'mh5_bl_app'
    },
    // 加密
    md5: {
        // 加密秘钥
        key: 'eGHJKLKJhbnFBfbnkjBJkhjvbnBnlHNjkhjBvbjjhvBNbnBNkjvhjBNLjkvbnklkhCJHBKKvhbJHGCgvjghCGCVCJhkghgVJBHGJchvhJHGJJHcvhjhGJHVHVHbjjhvhg'
    },
    // 上线的服务器
    online_server: {
        ip: '39.98.244.141'
    }
}


/**

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
        } catch (err) {
            return res.json({
                "code": 400,
                "error": "令牌无效!"
            })
        }
    }
 */