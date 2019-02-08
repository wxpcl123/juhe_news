import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'news_widget.dart';
import 'modal/news_type.dart';
import 'constants.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with SingleTickerProviderStateMixin {
  List<NewsType> newsTypes = List<NewsType>();

  List<NewsWidget> newsWidgets = [];
  TabController _tabController;

  @override
  void initState() {
    newsTypes = [
      const NewsType(type: 'top', description: '头条'),
      const NewsType(type: 'shehui', description: '社会'),
      const NewsType(type: 'guonei', description: '国内'),
      const NewsType(type: 'guoji', description: '国际'),
      const NewsType(type: 'yule', description: '娱乐'),
      const NewsType(type: 'tiyu', description: '体育'),
      const NewsType(type: 'junshi', description: '军事'),
      const NewsType(type: 'keji', description: '科技'),
      const NewsType(type: 'caijing', description: '财经'),
      const NewsType(type: 'shishang', description: '时尚'),
    ];
    _tabController = TabController(length: newsTypes.length, vsync: this);

    for (NewsType type in newsTypes) {
      newsWidgets.add(NewsWidget(newsType: type));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(Constants.appBarHeight + Constants.tabBarHeight),
        child: AppBar(
          title: Text('聚合新闻', style: AppStyles.appBarTitle),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: newsTypes.map((type) {
              return Text(type.description, style: AppStyles.tabBarText);
            }).toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: newsWidgets,
      ),
    );
  }
}
