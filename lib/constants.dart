import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = 'http://v.juhe.cn/toutiao/';
  static const String appKey = '15537be7c12442a398e9663959dbad8c';

  static const double appBarHeight = 56.0;
  static const double tabBarHeight = 26.0;
}

class AppStyles {
  static const TextStyle appBarTitle = TextStyle(
      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w300);
  static const TextStyle tabBarText =
      TextStyle(color: Colors.white, fontSize: 14.0);

  static const TextStyle newsItemTitle = TextStyle(fontSize: 14.0);
  static const TextStyle newsItemAuthor =
      TextStyle(fontSize: 12.0, color: Colors.black54);
}
