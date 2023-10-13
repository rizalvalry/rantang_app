import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Checkout extends StatefulWidget {
  final String redirectUrl; // Declare the redirectUrl parameter

  const Checkout({Key? key, required this.redirectUrl}) : super(key: key);

  @override
  State<Checkout> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  final _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(widget.redirectUrl)) {
              print(widget.redirectUrl);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.redirectUrl)); // Use widget.redirectUrl
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
