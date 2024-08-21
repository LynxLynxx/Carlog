import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_menu/star_menu.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  CustomFloatingButtonWidget({super.key});

  final StarMenuController controller = StarMenuController();

  @override
  Widget build(BuildContext context) {
    return StarMenu(
      controller: controller,
      params: const StarMenuParameters(
        shape: MenuShape.linear,
        linearShapeParams: LinearShapeParams(
          angle: 90,
          alignment: LinearAlignment.center,
          space: 15,
        ),
        animationCurve: Curves.easeOutCubic,
        centerOffset: Offset(0, -50),
        openDurationMs: 150,
      ),
      items: [
        CustomFloatingChildWidget(
          id: 3,
          starMenuController: controller,
        ),
        CustomFloatingChildWidget(
          id: 2,
          starMenuController: controller,
        ),
        CustomFloatingChildWidget(
          id: 1,
          starMenuController: controller,
        ),
        CustomFloatingChildWidget(
          id: 0,
          starMenuController: controller,
        ),
      ],
      child: FloatingActionButton(
        backgroundColor: context.primaryColor,
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: context.surfaceColor,
          ),
        ),
        onPressed: () {},
        elevation: 0.0,
        child: Icon(
          Icons.add,
          color: context.surfaceColor,
        ),
      ),
    );
  }
}

class CustomFloatingChildWidget extends StatelessWidget {
  final int id;
  final StarMenuController starMenuController;
  const CustomFloatingChildWidget(
      {super.key, required this.id, required this.starMenuController});

  getTitle() {
    switch (id) {
      case 0:
        return "Tankowanie";
      case 1:
        return "Serwis";
      case 2:
        return "Przebieg";
      case 3:
        return "Notatka";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (id == 1)
          {
            starMenuController.closeMenu!(),
            context.push(RoutesK.addAction, extra: context),
          }
        else if (id == 2)
          {
            starMenuController.closeMenu!(),
            context.push(RoutesK.addMilage, extra: context),
          }
      },
      child: Container(
        padding: PaddingsK.all8,
        decoration: BoxDecoration(
            borderRadius: PaddingsK.circular10,
            color: context.onPrimary,
            border: Border.all(color: context.primaryColor)),
        child: Text(
          getTitle(),
          textAlign: TextAlign.center,
          style: text16W500LS1,
        ),
      ),
    );
  }
}
