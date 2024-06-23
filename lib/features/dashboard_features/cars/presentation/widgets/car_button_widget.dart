import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CarButtonWidget extends StatelessWidget {
  final int page;

  const CarButtonWidget({super.key, required this.page});

  getAction(BuildContext context) {
    switch (page) {
      case 0:
        context.read<ManageCarBloc>().add(
              const ManageCarEvent.submitCarBrand(),
            );
      case 1:
        context.read<ManageCarBloc>().add(
              const ManageCarEvent.submitCarModel(),
            );
      case 2:
        context.read<ManageCarBloc>().add(
              const ManageCarEvent.submitCarMainInfo(),
            );
      case 3:
        context.read<ManageCarBloc>().add(
              const ManageCarEvent.submitCarSubMainInfo(),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ManageCarBloc, ManageCarState, bool>(
      selector: (state) {
        return true;
      },
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: state
              ? () {
                  getAction(context);
                }
              : null,
          shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular30),
          backgroundColor: context.primaryColor,
          child: SvgPicture.asset(
            ImagesK.arrowForward,
            colorFilter: ColorFilter.mode(context.onPrimary, BlendMode.srcIn),
          ),
        );
      },
    );
  }
}
