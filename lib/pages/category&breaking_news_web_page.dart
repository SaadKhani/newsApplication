import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryAndBreakingNewsWebPage extends StatefulWidget {
  final String blogUrl;
  const CategoryAndBreakingNewsWebPage({super.key, required this.blogUrl});

  @override
  State<CategoryAndBreakingNewsWebPage> createState() =>
      _CategoryAndBreakingNewsWebPageState();
}

class _CategoryAndBreakingNewsWebPageState
    extends State<CategoryAndBreakingNewsWebPage> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.blogUrl)),
    );
  }
}
