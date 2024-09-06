import 'package:carlog/core/addons/web_webview.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

class WebHomeViewLarge extends StatelessWidget {
  const WebHomeViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(
            child: Image.asset(
              ImagesK.carlogIphone,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Text(
                  "Track, Save, Analyze",
                  style: context.displayLarge!
                      .copyWith(color: context.primaryColor, fontSize: 35),
                ),
                Text(
                  "Your Car's journey",
                  style: context.displayLarge!.copyWith(
                      color: context.primaryColor,
                      fontSize: 45,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 125,
                ),
                Padding(
                  padding: PaddingsK.h30,
                  child: Text(
                    "Get Carlog now and take control of your car's history. Available on the App Store and Google Play.",
                    style: context.displaySmall!.copyWith(
                      color: context.primaryColor,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl("https://www.apple.com/"),
                      child: Image.asset(
                        ImagesK.appAppStore,
                        width: 200,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    GestureDetector(
                      onTap: () =>
                          launchUrl("https://play.google.com/store/games"),
                      child: Image.asset(
                        ImagesK.appGooglePlay,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
