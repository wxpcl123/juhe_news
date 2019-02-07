import 'package:flutter/material.dart';
import '../modal/news.dart';
import '../constants.dart';
import '../utils/flutter_inappbrowser.dart';

class DetailedNewsWidget extends StatefulWidget {
  final Data data;
  DetailedNewsWidget({this.data});
  @override
  _DetailedNewsWidgetState createState() => new _DetailedNewsWidgetState();
}

class _DetailedNewsWidgetState extends State<DetailedNewsWidget> {
  InAppWebViewController webView;
  Data data;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    data = widget.data;
    setState(() {
      url = widget.data.url;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = data.title.length > 18
        ? data.title.substring(0, 16) + '...'
        : data.title;
    return Scaffold(
      appBar: AppBar(title: Text(title, style: AppStyles.appBarTitle)),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
            ),
            (progress != 1.0) ? LinearProgressIndicator(value: progress) : null,
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: new InAppWebView(
                  initialUrl: url,
                  initialHeaders: {},
                  initialOptions: {},
                  onWebViewCreated: (InAppWebViewController controller) {
                    print('-----onWebViewCreated!------');
                    webView = controller;
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    print("started $url");
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
          ], //.where((Object o) => o != null).toList(),
        ),
      ),
    );
  }
}
