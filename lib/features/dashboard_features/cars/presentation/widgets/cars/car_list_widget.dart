import 'package:carlog/core/constants/account_limits.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/add_car_list_element_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/car_list_element_widget.dart';
import 'package:carlog/shared/widgets/carlog_loader.dart';
import 'package:carlog/shared/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<CarsBloc, CarsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CarlogLoader(),
          loading: () => const CarlogLoader(),
          data: (carList) => _buildListView(carList),
          failure: (failure) => ErrorIndicator(failure: failure),
        );
      },
    );
  }

  _buildListView(List<CarFirebaseEntity> carList) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: _buildCarListWidget(carList),
    );
  }

  _buildCarListWidget(List<CarFirebaseEntity> carList) {
    if (carList.isEmpty) {
      return [const AddCarListElementWidget()];
    } else if (carList.length < AccountLimitsK.carCountLimitFree) {
      return [
        ...carList.map((car) => CarListElementWidget(carEntity: car)),
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
