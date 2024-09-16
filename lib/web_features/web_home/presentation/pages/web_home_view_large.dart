import 'package:carlog/core/constants/images.dart';
import 'package:carlog/web_features/web_home/presentation/widgets/web_home_widgets.dart';
import 'package:flutter/material.dart';

class WebHomeViewLarge extends StatelessWidget {
  const WebHomeViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          _buildRectangle(),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildRectangle() => Align(
      alignment: Alignment.topLeft,
      child: Image.asset(ImagesK.backgroundRight));

  Widget _buildBody(BuildContext context) => Row(
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
          _buildData(context),
        ],
      );

  Widget _buildData(BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            trackSaveAnalyze(context),
            yourCarsJourney(context),
            const SizedBox(
              height: 125,
            ),
            getCarlogNow(context),
            const SizedBox(
              height: 30,
            ),
            buttons(context),
          ],
        ),
      );
}
