import 'package:carlog/features/auth_features/shared/widgets/car_hero_widget.dart';
import 'package:carlog/features/other_features/webview/presentation/pages/webview_page.dart';
import 'package:carlog/main.dart';
import 'package:flutter/material.dart';

class RequestFeaturePage extends StatefulWidget {
  const RequestFeaturePage({super.key});

  @override
  State<RequestFeaturePage> createState() => _RequestFeaturePageState();
}

class _RequestFeaturePageState extends State<RequestFeaturePage> {
  bool _isInitialize = false;
  String url = "";

  @override
  initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    String ssoToken = await getCannyToken();
    url =
        "https://webview.canny.io?boardToken=3e9fed8b-329d-efba-abaa-aa96a1934580&ssoToken=$ssoToken";
    setState(() {
      _isInitialize = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialize ? WebviewPage(url: url) : const CarHeroWidget();
  }
}
