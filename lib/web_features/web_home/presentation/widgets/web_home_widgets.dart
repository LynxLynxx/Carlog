import 'package:carlog/core/addons/web_webview.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/constants/urls.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

Widget trackSaveAnalyze(BuildContext context) => Padding(
      padding: PaddingsK.h20,
      child: Text(
        S.of(context).trackSaveAnalyze,
        style: context.displayLarge!
            .copyWith(color: context.primaryColor, fontSize: 35),
        textAlign: TextAlign.center,
      ),
    );

Widget yourCarsJourney(BuildContext context) => Padding(
            padding: PaddingsK.h20,
            child: Text(
              S.of(context).yourCarsJourney,
              style: context.displayLarge!.copyWith(
                  color: context.primaryColor,
                  fontSize: 45,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          );

Widget getCarlogNow(BuildContext context) => Padding(
            padding: PaddingsK.h30,
            child: Text(
              S.of(context).getCarlogNow,
              style: context.displaySmall!.copyWith(
                color: context.primaryColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          );

Widget buttons(BuildContext context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => launchUrl(UrlsK.appStoreUrl),
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
                onTap: () => launchUrl(UrlsK.playStoreUrl),
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
          );