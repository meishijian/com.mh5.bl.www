// 引入 Mock
import Mock from "mockjs";

// 轮播图
Mock.mock("http://127.0.0.1:9595/api/v1/main_ad_images", "get", {
    "code": 200,
    "data|8": [{
        "image": "@dataImage(375x200)",
        "link": "www.baidu.com"
    }]
})
// 相见恨晚轮播图
Mock.mock("http://127.0.0.1:9595/api/v1/main_small_images", "get", {
    "code": 200,
    "data|2": [{
        "image": "@dataImage(375x200)",
        "link": "www.baidu.com"
    }]
})

// 精选推荐
// Mock.mock("http://127.0.0.1:9595/api/v1/main_selected_images", "get", {
//     "code": 200,
//     "data|8": [{
//         "image": "@dataImage(82x75)",
//         "link": "www.baidu.com"
//     }]
// })