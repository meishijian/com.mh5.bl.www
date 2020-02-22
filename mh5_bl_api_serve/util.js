// 所有工具函数都写到这里 
const multer = require('multer');
const moment = require('moment');
const fs = require('fs');
/* 上传图片相关 */

// 创建存储对象
const storage = multer.diskStorage({
    // 配置保存文件的路径
    destination: function (req, file, cb) {

        // 1.先获取今天的日期，格式：年月日，如：20191209
        let today = moment().format('YYYYMMDD')
        fs.access('./uploads', fs.constants.F_OK, (error) => {
            if (error) {
                fs.mkdir('uploads', (err) => { })
            }
            // 2. 判断 uploads 上是否有这个目录
            let dir = './uploads/' + today
            fs.access(dir, fs.constants.F_OK, (err) => {
                // 如果目录不存在就创建
                if (err) {
                    fs.mkdir(dir, (err) => { })
                }
                // 设置上传图片的目录为当前日期的目录
                cb(null, dir)
            });
        })

    },
    // 自定义上传文件名
    // req：请求对象
    // file：上传的文件信息
    filename: function (req, file, cb) {
        // 用当前时间戳做为新上传的文件名
        //           获取当前时间戳 (123445543)   + 从原图片中提取出图片的后缀名    a.jpg.png       b.png-->.png
        let newName = Date.now() + '.' + file.originalname.substr(file.originalname.lastIndexOf('.') + 1)
        cb(null, newName)
    }
})

// 创建一个上传图片
const upload = multer({
    storage, // 前面创建的存储对象
    // 最大尺寸限制
    limits: {
        fileSize: 1024 * 1024 * 4 // 最大 4M ，单位：字节
    },
    // 自定义上传过滤器
    fileFilter: (req, file, cb) => {
        // 文件类型
        if (['image/png', 'image/jpeg', 'image/jpg', 'image/gif'].indexOf(file.mimetype) !== -1)
            cb(null, true)
        else
            cb(new Error('不允许上传的类型'))
    }
})
module.exports = {
    upload
}