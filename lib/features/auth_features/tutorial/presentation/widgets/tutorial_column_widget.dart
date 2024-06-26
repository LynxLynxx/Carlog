import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TutorialColumnWidget extends StatelessWidget {
  final int id;

  const TutorialColumnWidget({super.key, required this.id});

  getAnimation(id) {
    switch (id) {
      case 0:
        return AnimationsK.notification;
      case 1:
        return AnimationsK.statistics;
      case 2:
        return AnimationsK.electric;
    }
  }

  getTitle(
    id,
  ) {
    switch (id) {
      case 0:
        return S.current.notifications;
      case 1:
        return S.current.analytics;
      case 2:
        return S.current.electricCars;
    }
  }

  getSubtitle(id) {
    switch (id) {
      case 0:
        return S.current.bodyReciveNotifications;
      case 1:
        return S.current.bodyAnalyticsTutorial;
      case 2:
        return S.current.bodyElectricCarsTutorial;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 350,
          width: size.width * 0.9,
          child: LottieBuilder.asset(
            getAnimation(id),
            repeat: id == 2,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: 393,
          height: 50,
          alignment: Alignment.topCenter,
          child: AutoSizeText(
            getTitle(id),
            maxLines: 2,
            style: text22W700LS3.copyWith(fontSize: 26),
          ),
        ),
        Container(
          width: 393,
          height: 80,
          alignment: Alignment.topCenter,
          margin: PaddingsK.h20,
          child: Text(
            getSubtitle(id),
            textAlign: TextAlign.center,
            style: text16W500LS1,
          ),
        ),
      ],
    );
  }
}
