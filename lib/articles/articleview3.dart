import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/reusableWidgets.dart';

class Article3 extends StatefulWidget {
  const Article3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebviewDemoState();
  }
}

class _WebviewDemoState extends State<Article3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
        title: Text(
          'How to be Happy',
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
            initialUrl: "https://www.nytimes.com/guides/well/how-to-be-happy",
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      ),
    );

  }
}
