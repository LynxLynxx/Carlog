import 'package:carlog/features/auth_features/shared/widgets/car_hero_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_admob_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  final String url;
  const WebviewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics.instance
    //     .logScreenView(screenClass: "WebviewScreen", screenName: "webview");
    return _WebViewFullScreen(url: url);
  }
}

class _WebViewFullScreen extends StatefulWidget {
  final String url;
  const _WebViewFullScreen({required this.url});

  @override
  State<_WebViewFullScreen> createState() => _WebViewFullWidgetState();
}

class _WebViewFullWidgetState extends State<_WebViewFullScreen> {
  late WebViewController webViewController;
  bool isLoaded = false;
  String initialUrl = "";
  bool isFirstLoaded = true;

  @override
  void initState() {
    if (!widget.url.contains("http")) {
      initialUrl = "https://${widget.url}";
    } else {
      initialUrl = widget.url;
    }
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            setState(() {
              isLoaded = true;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).requestNewFeature),
      ),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Durations.long1,
            child: isLoaded
                ? WebViewWidget(controller: webViewController)
                : const CarHeroWidget(),
          ),
          const CarlogAdmobBannerWidget(),
        ],
      ),
    );
  }
}
