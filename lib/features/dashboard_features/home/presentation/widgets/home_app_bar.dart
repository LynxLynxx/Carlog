import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:skeletonizer/skeletonizer.dart';

SliverAppBar homeAppBar(
  BuildContext context,
) {
  return SliverAppBar(
    toolbarHeight: 50,
    expandedHeight: 120,
    collapsedHeight: 50,
    backgroundColor: context.surfaceColor,
    flexibleSpace: Container(
      padding: PaddingsK.h20,
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello again,",
                      style: context.titleMedium!
                          .copyWith(color: context.onSurface),
                    ),
                    Text(
                      "${FirebaseAuth.instance.currentUser?.displayName ?? "Joe"}!",
                      style: context.titleLarge!
                          .copyWith(color: context.onSurface),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImagesK.search,
                      width: 35,
                      height: 35,
                      colorFilter: ColorFilter.mode(
                          context.onPrimaryContainer, BlendMode.srcIn),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      ImagesK.bell,
                      width: 30,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                          context.onPrimaryContainer, BlendMode.srcIn),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const DropDownWidget(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      builder: (context, state) {
        if (state.status.isInProgress || state.status.isInitial) {
          return Skeletonizer(
              child: Container(
            height: 50,
            margin: PaddingsK.h20,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: dropShadowEffect().copyWith(
              color: context.surfaceDim,
              borderRadius: PaddingsK.circular30,
            ),
            padding: PaddingsK.h20v10,
            child: CarSelectElementWidget(
                carFirebaseEntity: CarFirebaseEntity.example()),
          ));
        }
        return state.carList.isNotEmpty
            ? DropdownButtonHideUnderline(
                child: Container(
                  height: 50,
                  margin: PaddingsK.h20,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: dropShadowEffect().copyWith(
                    color: context.surfaceDim,
                    borderRadius: PaddingsK.circular30,
                  ),
                  padding: PaddingsK.h20v10,
                  child: DropdownButton2<CarFirebaseEntity>(
                    value: context.watch<UserAppBloc>().state.car!,
                    isExpanded: true,
                    items: state.carList
                        .map((model) => DropdownMenuItem(
                            value: model,
                            child: CarSelectElementWidget(
                                carFirebaseEntity: model)))
                        .toList(),
                    onChanged: (CarFirebaseEntity? newValue) {
                      context.read<UserAppBloc>().add(
                            UserAppEvent.selectCar(newValue!),
                          );
                    },
                    iconStyleData: const IconStyleData(iconSize: 0),
                    dropdownStyleData: DropdownStyleData(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: dropShadowEffect().copyWith(
                        color: context.surfaceDim,
                        borderRadius: PaddingsK.circular30,
                      ),
                      offset: const Offset(-20, 40),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class CarSelectElementWidget extends StatelessWidget {
  final CarFirebaseEntity? carFirebaseEntity;
  const CarSelectElementWidget({
    super.key,
    required this.carFirebaseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              carFirebaseEntity?.brand ?? "",
              style: context.headlineSmall!.copyWith(
                color: context.onPrimaryContainer,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              carFirebaseEntity?.model ?? "",
              style: context.titleMedium!.copyWith(
                color: context.secondaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              carFirebaseEntity?.milage ?? "",
              style: context.headlineSmall!
                  .copyWith(color: context.onPrimaryContainer),
            ),
            Text(
              "KM",
              style: context.labelSmall!.copyWith(
                color: context.secondaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
