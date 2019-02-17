import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../modal/news.dart';
import '../constants.dart';

class DetailedWidget extends StatefulWidget {
  final Data data;
  DetailedWidget({this.data});

  @override
  State<StatefulWidget> createState() => _DetailedWidgetState();
}

class _DetailedWidgetState extends State<DetailedWidget> {
  Data data;

  /// 标记是否是加载中
  bool loading = true;

  /// 监控url变化, 当在webView显示状态下点击其中的链接时会触发
  StreamSubscription<String> onUrlChanged;

  StreamSubscription<WebViewStateChanged> onWebViewStateChanged;

  /// 插件提供的对象，该对象用于WebView的各种操作
  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    data = widget.data;

    // 禁止外链: 监听url地址改变事件, 点击其它任何链接都直接回退
    onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (data.url != url) {
        flutterWebViewPlugin.stopLoading();
        flutterWebViewPlugin.close();
        Navigator.pop(context);
      }
    });

    //监听webview状态变化
    onWebViewStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
          print('---should start----');
          setState(() {
            loading = true;
          });
          break;
        case WebViewState.startLoad:
          print('---start load---');
          setState(() {
            loading = true;
          });
          break;
        case WebViewState.finishLoad:
          print('---finish loaded---');
          setState(() {
            loading = false;
          });
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = data.title.length > 18
        ? data.title.substring(0, 16) + '...'
        : data.title;
    return WebviewScaffold(
      appBar: AppBar(title: Text(title, style: AppStyles.appBarTitle)),
      url: data.url,
      // 不要让javaScript运行, 太多垃圾广告
      withJavascript: false,
      withLocalStorage: true,
      withZoom: false,
      //hidden和initialChild参数可选, 以便在等待页面加载时show something
      hidden: true,
      initialChild: Center(child: Text('waiting......')),
    );
  }

  @override
  void dispose() {
    onUrlChanged.cancel();
    onWebViewStateChanged.cancel();
    flutterWebViewPlugin.close();
    super.dispose();
  }
}
