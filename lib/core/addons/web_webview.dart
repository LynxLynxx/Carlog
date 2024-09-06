// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:js' as js;

Future<void> launchUrl(String url) async {
  js.context.callMethod('open', [url]);
}
