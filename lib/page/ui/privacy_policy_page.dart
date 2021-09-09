import 'package:briflynews/resource/api.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: WebView(
      initialUrl: privacyPolicyUrl,
      javascriptMode: JavascriptMode.unrestricted,
    )));
  }
}
