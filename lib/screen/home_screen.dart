import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  late WebViewController? controller;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Hwan\'Story'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () async {
            var canGoBack = await controller?.canGoBack();
            if (canGoBack == true) {
              controller?.goBack();
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (controller != null) {
                controller!.loadUrl('https://hwanstory.kr');
              }
            },
            icon: const Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: 'https://hwanstory.kr',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
