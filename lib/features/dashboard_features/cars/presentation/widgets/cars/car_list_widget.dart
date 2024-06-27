import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/account_limits.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class CarListWidget extends StatelessWidget {
  const CarListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CarListWidgetView();
  }
}

class CarListWidgetView extends StatelessWidget {
  const CarListWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarsBloc, CarsState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          SnackbarsK.errorSnackbar(state.message!).show(context);
        }
      },
      builder: (context, state) {
        if (state.status.isInProgress) {
          return const CircularProgressIndicator();
        }
        if (state.status.isSuccess) {
          return Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: _buildCarListWidget(state.carList),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  _buildCarListWidget(List<CarFirebaseEntity> carList) {
    if (carList.isEmpty) {
      return [const AddCarListElementWidget()];
    } else if (carList.length < AccountLimitsK.carCountLimitFree) {
      return [
        ...carList.map((car) => CarListElementWidget2(carEntity: car)),
        const AddCarListElementWidget()
      ];
    } else {
      return carList
          .take(AccountLimitsK.carCountLimitFree)
          .map((car) => CarListElementWidget(carEntity: car))
          .toList();
    }
  }
}

class CarListElementWidget extends StatelessWidget {
  final CarFirebaseEntity carEntity;
  const CarListElementWidget({super.key, required this.carEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutesK.manageCar, extra: {
        "carFirebaseEntity": carEntity,
        "appContext": context,
      }),
      child: Container(
        decoration:
            dropShadowEffect().copyWith(color: context.primaryContainer),
        margin: PaddingsK.all16,
        padding: PaddingsK.all24,
        height: 150,
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 125),
              decoration: BoxDecoration(
                  borderRadius: PaddingsK.circular10,
                  color: context.onSecondary),
              padding: PaddingsK.h20v10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    carEntity.brand ?? "Skoda",
                    style: context.titleLarge,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    carEntity.model ?? "Octavia",
                    style: context.labelSmall,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/car_sedan.png",
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      carEntity.fuelType ?? "Hybrid",
                      style: context.titleLarge,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      carEntity.carType ?? "Sedan",
                      style: context.bodySmall,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      carEntity.milage.toString(),
                      style: context.labelLarge,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class CarListElementWidget2 extends StatelessWidget {
//   final CarFirebaseEntity carEntity;
//   const CarListElementWidget2({super.key, required this.carEntity});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => context.push(RoutesK.manageCar, extra: {
//         "manageCarStatus": ManageCarStatus.edit,
//         "carFirebaseEntity": carEntity,
//         "appContext": context,
//       }),
//       child: Container(
//         decoration:
//             dropShadowEffect().copyWith(color: context.primaryContainer),
//         margin: PaddingsK.all16,
//         // padding: PaddingsK.all24,
//         height: 150,
//         width: double.infinity,
//         child: Stack(
//           children: [
//             ClipRRect(
//               child: Container(
//                 transform: Matrix4.translationValues(-165, 0, 0),
//                 child: Image.asset(
//                   width: double.infinity,
//                   height: 150,
//                   fit: BoxFit.contain,
//                   "assets/car_sedan.png",
//                   alignment: Alignment.bottomCenter,
//                   opacity: const AlwaysStoppedAnimation(0.2),
//                 ),
//               ),
//             ),
//             SizedBox(
//               child: Row(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     width: 150,
//                     padding: PaddingsK.h20v10,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         AutoSizeText(
//                           carEntity.brand ?? "Skoda",
//                           style: context.headlineMedium,
//                           maxLines: 1,
//                         ),
//                         AutoSizeText(
//                           carEntity.model ?? "Octavia",
//                           style: context.labelSmall,
//                           maxLines: 1,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         AutoSizeText(
//                           carEntity.fuelType ?? "Hybrid",
//                           style: context.titleSmall,
//                           maxLines: 1,
//                         ),
//                         AutoSizeText(
//                           carEntity.carType ?? "Sedan",
//                           style: context.titleSmall,
//                           maxLines: 1,
//                         ),
//                         AutoSizeText(
//                           "10100 km",
//                           style: context.titleMedium,
//                           maxLines: 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CarListElementWidget2 extends StatelessWidget {
  final CarFirebaseEntity carEntity;
  const CarListElementWidget2({super.key, required this.carEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutesK.manageCar, extra: {
        "carFirebaseEntity": carEntity,
        "appContext": context,
      }),
      child: Container(
        decoration:
            dropShadowEffect().copyWith(color: context.primaryContainer),
        margin: PaddingsK.all16,
        // padding: PaddingsK.all24,
        height: 150,
        width: double.infinity,
        child: Stack(
          children: [
            ClipRRect(
              child: Container(
                transform: Matrix4.translationValues(165, 0, 0),
                child: Image.asset(
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.contain,
                  "assets/car_sedan2.png",
                  alignment: Alignment.bottomCenter,
                  opacity: const AlwaysStoppedAnimation(0.2),
                ),
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: PaddingsK.h20v10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              carEntity.brand ?? "Skoda",
                              style: context.headlineMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              carEntity.model ?? "Octavia",
                              style: context.labelSmall,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              "10100 ",
                              style: context.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w500),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              "km",
                              style: context.titleMedium,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCarListElementWidget extends StatelessWidget {
  const AddCarListElementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutesK.addCar, extra: context),
      child: Padding(
        padding: PaddingsK.h30v10,
        child: Card(
          child:
              Container(margin: PaddingsK.all16, child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
