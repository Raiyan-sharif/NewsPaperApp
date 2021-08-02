import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  static const routeName = '/webpage';

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'] as String;
    final String categoryTitle = routeArgs['title'] as String;
    final String categoryWebLink = routeArgs['weblink'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(categoryTitle)),
        backgroundColor: Color.fromARGB(255,2, 136, 209),
      ),
      body: WebView(
        initialUrl: categoryWebLink,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}