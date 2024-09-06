import 'package:carlog/core/addons/web_webview.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

class WebHomeViewSmall extends StatelessWidget {
  const WebHomeViewSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: PaddingsK.h20,
            child: Text(
              "Track, Save, Analyze",
              style: context.displayLarge!
                  .copyWith(color: context.primaryColor, fontSize: 35),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: PaddingsK.h20,
            child: Text(
              "Your Car's journey",
              style: context.displayLarge!.copyWith(
                  color: context.primaryColor,
                  fontSize: 45,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
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
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Image.asset(
                    ImagesK.appAppStore,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              GestureDetector(
                onTap: () => launchUrl("https://play.google.com/store/games"),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Image.asset(
                    ImagesK.appGooglePlay,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
