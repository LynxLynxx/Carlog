import 'dart:io';

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/error_indicator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

SliverAppBar carlogCarAppBar(
  BuildContext context,
) {
  return SliverAppBar(
    toolbarHeight: 50,
    expandedHeight: Platform.isIOS ? 130 : 160,
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
                      S.of(context).welocomeBack,
                      style: context.titleMedium!
                          .copyWith(color: context.onSurface),
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                            authenticated: (user) => Text(
                                  "${context.read<AuthBloc>().userFirstName}!",
                                  style: context.titleLarge!
                                      .copyWith(color: context.onSurface),
                                ),
                            orElse: () =>
                                const Skeletonizer(child: Text("Joe!")));
                      },
                    ),
                  ],
                ),
                // TODO implement search and notification
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       ImagesK.search,
                //       width: 35,
                //       height: 35,
                //       colorFilter: ColorFilter.mode(
                //           context.onPrimaryContainer, BlendMode.srcIn),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     SvgPicture.asset(
                //       ImagesK.bell,
                //       width: 30,
                //       height: 30,
                //       colorFilter: ColorFilter.mode(
                //           context.onPrimaryContainer, BlendMode.srcIn),
                //     ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const DropDownWidget(),
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
      builder: (context, carsState) {
        return carsState.when(
          initial: () => _buildLoader(context),
          loading: () => _buildLoader(context),
          data: (carList) => _buildBody(carList),
          failure: (failure) => ErrorIndicator(failure: failure),
        );
      },
    );
  }

  _buildLoader(BuildContext context) => Skeletonizer(
          child: Column(
        children: [
          Container(
            height: 50,
            margin: PaddingsK.h20,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: dropShadowEffect(context).copyWith(
              color: context.surfaceDim,
              borderRadius: PaddingsK.circular30,
            ),
            padding: PaddingsK.h20v10,
            child: CarSelectElementWidget(
                carFirebaseEntity: CarFirebaseEntity.example()),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ));

  _buildBody(List<CarFirebaseEntity> carList) =>
      BlocBuilder<UserAppBloc, UserAppState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => Skeletonizer(
              child: Container(
                height: 50,
                margin: PaddingsK.h20,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: dropShadowEffect(context).copyWith(
                  color: context.surfaceDim,
                  borderRadius: PaddingsK.circular30,
                ),
                padding: PaddingsK.h20v10,
                child: CarSelectElementWidget(
                    carFirebaseEntity: CarFirebaseEntity.example()),
              ),
            ),
            data: (car) => _buildAppBody(
              context,
              carList,
              car,
            ),
            failure: (failure) => ErrorIndicator(failure: failure),
          );
        },
      );

  _buildAppBody(BuildContext context, List<CarFirebaseEntity> carList,
          CarFirebaseEntity? car) =>
      carList.isNotEmpty && car != null
          ? Column(
              children: [
                DropdownButtonHideUnderline(
                  child: Container(
                    height: 50,
                    margin: PaddingsK.h20,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: dropShadowEffect(context).copyWith(
                      color: context.surfaceDim,
                      borderRadius: PaddingsK.circular30,
                    ),
                    padding: PaddingsK.h20v10,
                    child: DropdownButton2<CarFirebaseEntity>(
                      value: car,
                      isExpanded: true,
                      items: carList
                          .map((model) => DropdownMenuItem(
                              value: model,
                              child: CarSelectElementWidget(
                                  carFirebaseEntity: model)))
                          .toList(),
                      onChanged: (CarFirebaseEntity? newValue) {
                        if (car != newValue) {
                          context.read<UserAppBloc>().add(
                                UserAppEvent.selectCar(newValue!),
                              );
                        }
                      },
                      iconStyleData: const IconStyleData(iconSize: 0),
                      dropdownStyleData: DropdownStyleData(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: dropShadowEffect(context).copyWith(
                          color: context.surfaceDim,
                          borderRadius: PaddingsK.circular30,
                        ),
                        offset: const Offset(-20, 40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          : const SizedBox.shrink();
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
