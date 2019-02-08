import 'package:flutter/material.dart';
import 'home_page_widget.dart';

void main() => runApp(MaterialApp(
      title: '聚合新闻头条',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePageWidget(),
    ));

//http://v.juhe.cn/toutiao/index?type=top&key=15537be7c12442a398e9663959dbad8c

//类型,top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚)
