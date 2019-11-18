// 导入 jsonwebtoken
const jwt = require('jsonwebtoken');
// 导入 配置文件 config
const config = require('./config');

// 生成令牌 封装令牌
// 在生成令牌时，要把用户的ID 放到令牌中
// 参数一、用户信息
// 参数二、秘钥
// 参数三、过期时间
const mktoken = data => jwt.sign(data, config.jwt.key, { expiresIn: config.jwt.expire });

// 导出 令牌
module.exports = mktoken;