// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebRequestFeatureViewLarge extends StatefulWidget {
  const WebRequestFeatureViewLarge({super.key});

  @override
  State<WebRequestFeatureViewLarge> createState() =>
      _WebRequestFeatureViewLargeState();
}

class _WebRequestFeatureViewLargeState extends State<WebRequestFeatureViewLarge>
    with AutomaticKeepAliveClientMixin {
  late WebViewController webViewController;

  String initialUrl =
      "https://webview.canny.io?boardToken=3e9fed8b-329d-efba-abaa-aa96a1934580";

  bool loaded = false;

  @override
  void initState() {
    platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) {
        final iframe = IFrameElement()
          ..src = initialUrl
          ..style.height = '100%'
          ..style.width = '100%'
          ..style.border = 'none';

        iframe.onLoad.listen((event) {
          if (mounted) {
            setState(() {
              loaded = true;
            });
          }
        });

        iframe.onError.listen((event) {
          if (mounted) {
            setState(() {
              loaded = false;
            });
          }
        });

        return iframe;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      loaded = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loaded == false)
            const Expanded(child: Center(child: CircularProgressIndicator())),
          const Expanded(child: HtmlElementView(viewType: 'iframeElement')),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
