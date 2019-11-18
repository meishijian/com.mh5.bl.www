// 导入 mysql
const mysql = require('mysql');
// 导入 配置文件
const config = require('./config');
// 创建  createConnection
const connection = mysql.createConnection(config.db);
// 连接 createConnection
connection.connect();
// 导出 createConnection
module.exports = connection;
