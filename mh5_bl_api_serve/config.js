module.exports = {
    // 启动服务器时使用的端口 和 IP
    server: {
        // 启动服务器端口号
        port: 9494,
        // IP
        ip: '127.0.0.1'
    },
    // 令牌
    jwt: {
        // 令牌秘钥
        key: 'asdfdgfdhfgjhghkjhgkjheGHJKLKJhbnFBfbnkjBJkhjvbnBnlHNjkhjBvbjjhvBNbnBNkjvhjBNLjkvbnklkhCJHBKKvhbJHGCgvjghCGCVCJhkghgVJBHGJchvhJHGJJHcvhjhGJ',
        // 过期时间
        expire: '4h'
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
    }
}