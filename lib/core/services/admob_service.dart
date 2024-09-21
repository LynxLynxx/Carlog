import 'dart:io';

import 'package:flutter/foundation.dart';

class AdmobService {
  AdmobService._internal();

  static final AdmobService _instance = AdmobService._internal();

  factory AdmobService() {
    return _instance;
  }

  String get bannerAdId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    } else {
      return Platform.isAndroid
          ? "ca-app-pub-1418011775391749/6027243604"
          : "ca-app-pub-1418011775391749/9475505774";
    }
  }

  String get appOpenId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/9257395921'
          : 'ca-app-pub-3940256099942544/5575463023';
    } else {
      return Platform.isAndroid
          ? "ca-app-pub-1418011775391749/1854183971"
          : "ca-app-pub-1418011775391749/7653866642";
    }
  }
}
