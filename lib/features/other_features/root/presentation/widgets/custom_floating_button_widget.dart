import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_service/manage_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      items: [
        const CustomFloatingChildWidget(id: 3),
        const CustomFloatingChildWidget(id: 2),
        BlocProvider(
          create: (context) => ManageServiceBloc(locator(), locator()),
          child: const CustomFloatingChildWidget(id: 1),
        ),
        const CustomFloatingChildWidget(id: 0),
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
    return GestureDetector(
      onTap: () => {
        if (id == 1)
          {
            context
                .read<ManageServiceBloc>()
                .add(const ManageServiceEvent.changeLatitude("40.689247")),
            context
                .read<ManageServiceBloc>()
                .add(const ManageServiceEvent.changeLongitude("-74.044502")),
            context
                .read<ManageServiceBloc>()
                .add(const ManageServiceEvent.submitServiceEvent()),
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
