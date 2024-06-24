import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PickCarSubMainDataWidget extends StatelessWidget {
  final List<TextEditingController> textEditingControllerList;
  const PickCarSubMainDataWidget(
      {super.key, required this.textEditingControllerList});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageCarBloc, ManageCarState>(
      listener: (context, state) {
        if (state.status.isFailure) {}
        if (state.status.isSuccess) {}
      },
      builder: (context, state) {
        return Column(
          children: [
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[0],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.carTypeChanged(value)),
              title: "Type",
              hintText: "e.g. SUV",
              displayError: state.typeEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[1],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.fuelTypeChanged(value)),
              title: "Fuel Type",
              hintText: "e.g. Hybrid",
              displayError: state.fuelTypeEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[2],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.engineCapacityChanged(value)),
              title: "Engine Capacity (cm3)",
              hintText: "e.g. AUM 550",
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
              displayError: state.engineCapacityEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[2],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.enginePowerChanged(value)),
              title: "Engine Power (HP)",
              hintText: "e.g. 163",
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              displayError: state.enginePowerEntity.displayError ?? "",
            ),
          ],
        );
      },
    );
  }
}
