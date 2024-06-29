import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/button_styles.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

SliverAppBar homeAppBar(
  BuildContext context,
  bool isExpanded,
  Function() func,
) {
  return SliverAppBar(
    toolbarHeight: isExpanded ? 350 : 330,
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
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      ImagesK.bell,
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DropDownWidget(
              isExpanded: isExpanded,
              func: func,
            ),
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
  final bool isExpanded;
  final Function() func;
  const DropDownWidget({
    super.key,
    required this.isExpanded,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state.carList.isEmpty) {
              return const CircularProgressIndicator();
            }
            return AnimatedContainer(
              duration: Durations.medium3,
              height: isExpanded ? 60 * state.carList.length.toDouble() : 60,
              margin: PaddingsK.h20,
              decoration: BoxDecoration(
                color:
                    isExpanded ? context.primaryContainer : context.surfaceDim,
                borderRadius: PaddingsK.circular30,
              ),
              padding: PaddingsK.h20v10,
              child: SingleChildScrollView(
                child: Column(
                  children: isExpanded
                      ? state.carList
                          .map((model) => GestureDetector(
                                onTap: () {
                                  context.read<UserAppBloc>().add(
                                        UserAppEvent.selectCar(model),
                                      );
                                  func();
                                },
                                child: CarSelectElementWidget(
                                  carFirebaseEntity: model,
                                ),
                              ))
                          .toList()
                      : [
                          CarSelectElementWidget(
                            carFirebaseEntity:
                                context.watch<UserAppBloc>().state.car!,
                          ),
                        ],
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 150,
          right: 150,
          bottom: 0,
          child: Transform.translate(
            offset: const Offset(0, 25),
            child: ElevatedButton(
              style: homeCarButton(context),
              onPressed: () => func(),
              child: AnimatedRotation(
                duration: DurationsK.d250,
                turns: isExpanded ? -0.5 : 0.0,
                child: Image.asset(
                  "assets/icons/arrow.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CarSelectElementWidget extends StatelessWidget {
  final CarFirebaseEntity carFirebaseEntity;
  const CarSelectElementWidget({
    super.key,
    required this.carFirebaseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                carFirebaseEntity.brand ?? "",
                style: context.headlineSmall!.copyWith(
                  color: context.onPrimaryContainer,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                carFirebaseEntity.model ?? "",
                style: context.titleMedium!.copyWith(
                  color: context.secondaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                carFirebaseEntity.milage ?? "",
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
      ),
    );
  }
}
