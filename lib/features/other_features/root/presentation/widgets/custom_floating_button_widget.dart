import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';

class CustomFloatingButtonWidget extends StatelessWidget {
  const CustomFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StarMenu(
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
      items: const [
        CustomFloatingChildWidget(id: 3),
        CustomFloatingChildWidget(id: 2),
        CustomFloatingChildWidget(id: 1),
        CustomFloatingChildWidget(id: 0),
      ],
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: CircleBorder(
          side: BorderSide(
            width: 5,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        onPressed: () {},
        elevation: 0.0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}

class CustomFloatingChildWidget extends StatelessWidget {
  final int id;
  const CustomFloatingChildWidget({super.key, required this.id});

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
    return Container(
      padding: PaddingsK.all8,
      decoration: BoxDecoration(
          borderRadius: PaddingsK.circular10,
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Text(
        getTitle(),
        textAlign: TextAlign.center,
        style: text16W500LS1,
      ),
    );
  }
}
