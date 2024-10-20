import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/view/youtube.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends StatelessWidget {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://flutter.dev/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homee'), // Tiêu đề AppBar
      ),
      // body: WebViewWidget(
      //   controller: controller,
      // ));
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => Youtube());
            },
            child: Text('phat youtubee'),
          ),

        ],
      ),
    );
  }
}
