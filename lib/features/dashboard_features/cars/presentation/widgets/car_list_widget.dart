import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/complex_add_car_page.dart';
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
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: BlocConsumer<CarsBloc, CarsState>(
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
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.carList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context.push(RoutesK.complexManageCar, extra: {
                  "manageCarStatus": ManageCarStatus.edit,
                  "carFirebaseEntity": state.carList[index],
                  "appContext": context,
                }),
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  margin: PaddingsK.all8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(state.carList[index].brand ?? ""),
                          Text(state.carList[index].model ?? ""),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(state.carList[index].year.toString()),
                          Text(state.carList[index].plate ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
