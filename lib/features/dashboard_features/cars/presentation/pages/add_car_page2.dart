import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/basic_add_car/basic_add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/manage_car_page.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AddCarPage extends StatelessWidget {
  final BuildContext appContext;
  const AddCarPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BasicAddCarBloc(),
        ),
        BlocProvider(
          create: (context) => ManageCarBloc(
            locator(),
            appContext.read<CarsBloc>(),
          ),
        ),
      ],
      child: AddCarView(
        appContext: appContext,
      ),
    );
  }
}

class AddCarView extends StatelessWidget {
  final BuildContext appContext;
  const AddCarView({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    final carList = CarEntity.fromMap(JsonsK.cars);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Text(
                    S.of(context).addCar,
                    style: text22W700LS3,
                  ),
                ),
              ],
            ),
            Padding(
              padding: PaddingsK.h20,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: LottieBuilder.asset(
                      AnimationsK.addCar,
                      repeat: false,
                    ),
                  ),
                  const Text(
                    "Car Brand",
                    style: text22W700LS3,
                  ),
                  BlocBuilder<BasicAddCarBloc, BasicAddCarState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () => context.read<BasicAddCarBloc>().add(
                                  BasicAddCarEvent.changeBrand(brandId: index)),
                              child: CarListElement(
                                  isSelected: index == state.brandId,
                                  text: carList[index].brand)),
                          itemCount: carList.length,
                        ),
                      );
                    },
                  ),
                  const Text(
                    "Model",
                    style: text22W700LS3,
                  ),
                  BlocBuilder<BasicAddCarBloc, BasicAddCarState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () => context.read<BasicAddCarBloc>().add(
                                  BasicAddCarEvent.changeModel(modelId: index)),
                              child: CarListElement(
                                  isSelected: index == state.modelId,
                                  text: carList[state.brandId].models[index])),
                          itemCount: carList[state.brandId].models.length,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Unable to locate your brand or model?",
                      style: text16W500LS1.copyWith(fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(
                      RoutesK.manageCar,
                      extra: {
                        "manageCarStatus": ManageCarStatus.add,
                        "appContext": appContext,
                      },
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter it manually!",
                        style:
                            text16W500LS1.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarListElement extends StatelessWidget {
  final String text;
  final bool isSelected;
  const CarListElement({
    super.key,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingsK.all8,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        border: Border.all(
          color: isSelected
              ? Colors.black
              : Colors.grey.withOpacity(
                  0.3,
                ),
        ),
      ),
      alignment: Alignment.center,
      width: 150,
      child: Text(text),
    );
  }
}
