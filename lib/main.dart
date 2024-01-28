import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWebView(),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
      },
    onWebResourceError: (WebResourceError error) {},
    onNavigationRequest: (NavigationRequest request) {
      return NavigationDecision.navigate;
    },
  ),
)
..loadRequest(Uri.parse('https://fuchs.onrender.com/frog'));


class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
