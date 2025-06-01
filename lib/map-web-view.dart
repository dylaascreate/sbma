import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbeddedMapPage extends StatefulWidget {
  const EmbeddedMapPage({super.key});

  @override
  State<EmbeddedMapPage> createState() => _EmbeddedMapPageState();
}

class _EmbeddedMapPageState extends State<EmbeddedMapPage> {
   final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadHtmlString('''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style> html, body { margin: 0; padding: 0; height: 100%; } iframe { border: 0; width: 100%; height: 100%; } </style>
      </head>
      <body>
        <iframe
          src="https://www.google.com/maps/embed/v1/place?q=Sultan+Idris+Education+University&key=AIzaSyD3dRzOt9YhFMPqu_qtT3bMr3gp7hnaTJE"
          allowfullscreen>
        </iframe>
      </body>
      </html>
    ''');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UPSI Map'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFA000),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
