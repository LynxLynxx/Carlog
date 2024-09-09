import 'package:carlog/web_features/web_home/presentation/widgets/web_home_widgets.dart';
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
          _buildTitle(context),
          const Spacer(),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Column(
        children: [
          trackSaveAnalyze(context),
          yourCarsJourney(context),
        ],
      );

  Widget _buildButtons(BuildContext context) => Column(
        children: [
          getCarlogNow(context),
          const SizedBox(
            height: 30,
          ),
          buttons(context),
          const SizedBox(
            height: 30,
          )
        ],
      );
}
