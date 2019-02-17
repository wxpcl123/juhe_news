import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'modal/news.dart';
import 'modal/news_type.dart';
import 'views/news_item_widget.dart';
import 'modal/pattern.dart';


class NewsWidget extends StatefulWidget {
  final NewsType newsType;
  NewsWidget({Key key, this.newsType}) : super(key: key);
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget>
    with AutomaticKeepAliveClientMixin {
  ///新闻列表的url地址
  String url;

  ///新闻数据列表
  List<Data> newsDataList;

  ///新闻数据加载完成标记
  bool _isNewsLoaded = false;

  //保存显示位置
  @override
  bool get wantKeepAlive => true;

  ///加载新闻
  Future<Null> _loadNews() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      News news = News.fromJson(jsonDecode(response.body));
      newsDataList = news.result.data;
      setState(() {
        _isNewsLoaded = true;
      });
    }
  }

  @override
  void initState() {
    //组合URL
    url =
        '${Constants.baseUrl}index?type=${widget.newsType.type}&key=${Constants.appKey}';
    //加载新闻
    _loadNews();
    super.initState();
  }

  ///新闻列表Widget
  Widget _newsListWidget() {
    Pattern pattern;
    return ListView.builder(
      itemCount: newsDataList.length,
      itemBuilder: (BuildContext context, int index) {
        //如果没有第三章缩略图, 则50%的概率图片在左, 50%概率图片在右
        if (newsDataList[index].thumbnailPics3 == null) {
          pattern = Random(DateTime.now().microsecond).nextBool()
              ? Pattern.LEFT
              : Pattern.RIGHT;
        } else {
          //10%的概率出multiPic,45%的概率图片在左, 45%概率图片在右
          pattern = Random(DateTime.now().microsecond).nextInt(10) > 8
              ? Pattern.MULTI
              : Random(DateTime.now().microsecond).nextBool()
                  ? Pattern.LEFT
                  : Pattern.RIGHT;
        }
        return NewsItemWidget(pattern: pattern, data: newsDataList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadNews,
      child: _isNewsLoaded
          ? _newsListWidget()
          : Center(child: RefreshProgressIndicator()),
    );
  }
}
