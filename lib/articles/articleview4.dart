import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/reusableWidgets.dart';

class Article4 extends StatefulWidget {
  const Article4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebviewDemoState();
  }
}

class _WebviewDemoState extends State<Article4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
        title: Text(
          'Dealing with Anger',
          textAlign: TextAlign.center,
          style: textStyle('JosefinSans', FontWeight.bold, 20.0, Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.deepPurple,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return const WebView(
            initialUrl:
                "https://au.reachout.com/articles/8-ways-to-deal-with-anger",
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      ),
    );
  }
}
