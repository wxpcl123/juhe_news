import 'package:flutter/material.dart';


import '../modal/news.dart';
import '../modal/pattern.dart';
import '../constants.dart';
import 'detailed_widget.dart';

class NewsItemWidget extends StatelessWidget {
  final Data data;
  final Pattern pattern;
  NewsItemWidget({Key key, this.data, this.pattern}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double itemMargin = 5.0;
    final double imageWidth = (totalWidth - itemMargin) / 3;
    final double itemPadding = 10.0;

    ///单张图片Widget
    Widget singlePic(double scale, String url) {
      return Image.network(url,
          width: imageWidth * scale,
          height: imageWidth * scale * 3 / 4,
          fit: BoxFit.cover);
    }

    ///标题栏,@lineNum:标题行的数量
    Widget titleWidget(int lineNum) {
      return Text(data.title,
          maxLines: lineNum, overflow: TextOverflow.ellipsis);
    }

    ///作者和发布日期信息
    Widget authorAndDateInfo() {
      String author = data.authorName.length < 12
          ? data.authorName
          : '${data.authorName.substring(0, 12)}...';
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(author, style: AppStyles.newsItemAuthor),
          Text(data.date, style: AppStyles.newsItemAuthor)
        ],
      );
    }

    ///组合标题和作者等信息
    Widget titleAndAuthorAsm() {
      return Container(
        width: totalWidth - imageWidth - itemPadding * 2,
        height: imageWidth * 3 / 4,
        padding: EdgeInsets.symmetric(horizontal: itemPadding, vertical: 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget(2),
            authorAndDateInfo(),
          ],
        ),
      );
    }

    ///多图表达
    Widget multiPicNewsWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget(1),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              singlePic(0.95, data.thumbnailPicS),
              singlePic(0.95, data.thumbnailPics2),
              singlePic(0.95, data.thumbnailPics3),
            ],
          ),
          SizedBox(height: 12.0),
          authorAndDateInfo(),
        ],
      );
    }

    Widget patternedWidget(Pattern pattern) {
      switch (pattern) {
        case Pattern.MULTI:
          return multiPicNewsWidget();
        case Pattern.LEFT:
          return Row(children: <Widget>[
            singlePic(1.0, data.thumbnailPicS),
            titleAndAuthorAsm()
          ]);
        case Pattern.RIGHT:
          return Row(children: <Widget>[
            titleAndAuthorAsm(),
            singlePic(1.0, data.thumbnailPicS)
          ]);
        default:
          return null;
      }
    }

    void loadDetailedNewsWidget(Data data) {
      // 常用flutterWebViewPlugin实现方法
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DetailedWidget(data: data)));

      //InAppWebView实现方法
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (BuildContext context) {
      //       return DetailedNewsWidget(data: data);
      //     }));
    }

    return GestureDetector(
      onTap: () {
        loadDetailedNewsWidget(data);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: itemMargin),
        padding: EdgeInsets.all(itemPadding),
        color: Colors.white,
        child: patternedWidget(pattern),
      ),
    );
  }
}
