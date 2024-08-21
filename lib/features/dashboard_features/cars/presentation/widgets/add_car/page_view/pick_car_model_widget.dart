import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickCarModelWidget extends StatefulWidget {
  const PickCarModelWidget({super.key});

  @override
  State<PickCarModelWidget> createState() => _PickCarModelWidgetState();
}

class _PickCarModelWidgetState extends State<PickCarModelWidget> {
  bool isManually = false;

  int? getBrandId(String brand) {
    for (var car in CarEntity.fromMap(JsonsK.cars)) {
      if (car.brand == brand) {
        return car.id;
      }
    }
    return null;
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carList = CarEntity.fromMap(JsonsK.cars);

    return AnimatedSwitcher(
      duration: DurationsK.d500,
      child: !isManually
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.46,
                  child: BlocBuilder<ManageCarBloc, ManageCarState>(
                    builder: (context, state) {
                      int carId = getBrandId(state.brandEntity.value) ?? 0;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () => context.read<ManageCarBloc>().add(
                                ManageCarEvent.modelChanged(
                                    carList[carId].models[index])),
                            child: _ListElementWidget(
                                maxHeight: 75,
                                model: carList[carId].models[index],
                                state: state)),
                        itemCount: carList[carId].models.length,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).unableToLocateYourModel,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: context.onPrimaryContainer),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isManually = true;
                    context
                        .read<ManageCarBloc>()
                        .add(const ManageCarEvent.modelChanged(""));
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).enterItManually,
                      style: context.labelLarge!.copyWith(
                          color: context.onPrimaryContainer,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            )
          : BlocBuilder<ManageCarBloc, ManageCarState>(
              builder: (context, state) {
                return ListElementTextfieldWidget(
                  textEditingController: textEditingController,
                  func: (value) => context
                      .read<ManageCarBloc>()
                      .add(ManageCarEvent.modelChanged(value)),
                  title: S.of(context).carModel,
                  hintText: S.of(context).egXC90,
                  isRequired: true,
                  displayError: state.modelEntity.displayError ?? "",
                  funcClose: () => setState(() {
                    isManually = false;
                    context
                        .read<ManageCarBloc>()
                        .add(const ManageCarEvent.modelChanged(""));
                  }),
                );
              },
            ),
    );
  }
}

class _ListElementWidget extends StatelessWidget {
  const _ListElementWidget({
    required this.maxHeight,
    required this.model,
    required this.state,
  });

  final double maxHeight;
  final String model;
  final ManageCarState state;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        padding: PaddingsK.all16,
        margin: EdgeInsets.symmetric(
            vertical: state.modelEntity.value == model ? 2 : 5, horizontal: 15),
        width: double.infinity,
        decoration: dropShadowEffect(context).copyWith(
          border: state.modelEntity.value == model
              ? Border.all(
                  color: context.primaryColor,
                  width: 3,
                )
              : null,
          borderRadius: PaddingsK.circular10,
          color: context.primaryContainer,
        ),
        child: Text(
          model,
          style: context.bodyLarge!.copyWith(
            color: context.onPrimaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
