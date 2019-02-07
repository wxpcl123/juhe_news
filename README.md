# 聚合新闻客户端

## Getting Started

Flutter学习之作.

聚合新闻头条接口来源:   [https://www.juhe.cn/docs/api/id/235];

接口地址：[http://v.juhe.cn/toutiao/index]
返回格式：json
请求方式：get/post
请求示例：[http://v.juhe.cn/toutiao/index?type=top&key=APPKEY]

APPKEY: 申请时给出的AppKey
type:   新闻类型, 如下
        top(头条，默认),
        shehui(社会),
        guonei(国内),
        guoji(国际),
        yule(娱乐),
        tiyu(体育),
        junshi(军事),
        keji(科技),
        caijing(财经),
        shishang(时尚)

## Json格式

每次发起get请求, 返回30条新闻数据, 格式如下, 注意其中缩略图[thumbnail_pic]有三种形式, 分别是
有1张:  [thumbnail_pic_s],
有2张:  [thumbnail_pic_s],[thumbnail_pic_s02],
有3张:  [thumbnail_pic_s],[thumbnail_pic_s02],[thumbnail_pic_s03]
因此显示新闻列表时可以稍微做点变通, 否则会有些单调, 具体见代码.

{
    "reason": "成功的返回",
    "result": {
        "stat": "1",
        "data": [
            {
                "uniquekey": "6165219384ce9cccb80de70ed68d025a",
                "title": "这种果对身体很好，治咳嗽咽痛，降脂降压，特别适合中老年人食用",
                "date": "2019-02-07 15:22",
                "category": "头条",
                "author_name": "健康养生小达人",
                "url": "http:\/\/mini.eastday.com\/mobile\/190207152204918.html",
                "thumbnail_pic_s": "http:\/\/01imgmini.eastday.com\/mobile\/20190207\/2019020715_25f477caabd8492dbf5a5597444258b4_4993_mwpm_03200403.jpg",
                "thumbnail_pic_s02": "http:\/\/01imgmini.eastday.com\/mobile\/20190207\/2019020715_8ab64a0628d64bebb4ec28c487547a22_6551_mwpm_03200403.jpg",
                "thumbnail_pic_s03": "http:\/\/01imgmini.eastday.com\/mobile\/20190207\/2019020715_3404afb6125e44cc92cd7927d64b2675_4220_mwpm_03200403.jpg"
            },
            {
                "uniquekey": "08188558ecf087b8f7cd0ec136cc7089",
                "title": "【过大年 迎新春】河南洛阳 龙门石窟：游人如织 热闹喜庆",
                "date": "2019-02-07 15:05",
                "category": "头条",
                "author_name": "央视网",
                "url": "http:\/\/mini.eastday.com\/mobile\/190207150558236.html",
                "thumbnail_pic_s": "http:\/\/02imgmini.eastday.com\/mobile\/20190207\/20190207150558_b22db4e14946e41cd1acb54fd761b54b_2_mwpm_03200403.jpg",
                "thumbnail_pic_s02": "http:\/\/02imgmini.eastday.com\/mobile\/20190207\/20190207150558_b22db4e14946e41cd1acb54fd761b54b_1_mwpm_03200403.jpg"
            },
            {
                "uniquekey": "54f61edcd7fb910057ed19f126b9b6bd",
                "title": "上市仅半年，拼多多宣布再融资10亿美元！市值一夜蒸发170亿",
                "date": "2019-02-07 15:01",
                "category": "头条",
                "author_name": "赵冰峰",
                "url": "http:\/\/mini.eastday.com\/mobile\/190207150119288.html",
                "thumbnail_pic_s": "http:\/\/06imgmini.eastday.com\/mobile\/20190207\/20190207150119_ac0e9da476b4de607f1e9238b20d46e3_1_mwpm_03200403.jpg"
            },
            {
                "uniquekey": "e6f3cac76e4a7dc557f9b8bac0fc88aa",
                "title": "轻松得到皇位, 登上皇位后才发现, 自己捡了个世界上最大的烂摊子",
                "date": "2019-02-07 15:01",
                "category": "头条",
                "author_name": "海贼王最新资讯",
                "url": "http:\/\/mini.eastday.com\/mobile\/190207150114571.html",
                "thumbnail_pic_s": "http:\/\/06imgmini.eastday.com\/mobile\/20190207\/20190207150114_0668b94fac2849791883162d83f9e28b_1_mwpm_03200403.jpg",
                "thumbnail_pic_s02": "http:\/\/06imgmini.eastday.com\/mobile\/20190207\/20190207150114_0668b94fac2849791883162d83f9e28b_2_mwpm_03200403.jpg",
                "thumbnail_pic_s03": "http:\/\/06imgmini.eastday.com\/mobile\/20190207\/20190207150114_0668b94fac2849791883162d83f9e28b_3_mwpm_03200403.jpg"
            },
            ...
        ]
    },
    "error_code": 0
}

## 
