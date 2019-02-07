import 'package:flutter/material.dart';
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
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      //resizeToAvoidBottomPadding,该属性设置是否自动调整body属性控件的大小，
      //以避免脚手架底部被覆盖。例如，如果在脚手架上方显示屏幕键盘，则可调整body属性控件的大小以避免被键盘覆盖。
      //如果你不需要此功能，可以将resizeToAvoidBottomPadding属性设置为false
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(height: statusBarHeight, color: Colors.red),
          Container(
            color: Colors.red,
            height: Constants.appBarHeight,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text('聚合新闻', style: AppStyles.appBarTitle),
          ),
          Container(
            color: Colors.red,
            height: Constants.tabBarHeight,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: newsTypes.map((type) {
                return Text(type.description, style: AppStyles.tabBarText);
              }).toList(),
            ),
          ),
          Container(
            width: totalWidth,
            height: totalHeight -
                statusBarHeight -
                Constants.appBarHeight -
                Constants.tabBarHeight,
            color: Colors.black12,
            child: TabBarView(
              controller: _tabController,
              children: newsWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
