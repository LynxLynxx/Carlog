import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/custom_dropdown_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
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
            CustomDropdownWidget(
              title: S.of(context).type,
              id: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropdownWidget(
              title: S.of(context).fuelType,
              id: 1,
            ),
            // ListElementTextfieldWidget(
            //   textEditingController: textEditingControllerList[0],
            //   func: (value) => context
            //       .read<ManageCarBloc>()
            //       .add(ManageCarEvent.carTypeChanged(value)),
            //   title: S.of(context).type,
            //   hintText: S.of(context).egSUV,
            //   displayError: state.typeEntity.displayError ?? "",
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ListElementTextfieldWidget(
            //   textEditingController: textEditingControllerList[1],
            //   func: (value) => context
            //       .read<ManageCarBloc>()
            //       .add(ManageCarEvent.fuelTypeChanged(value)),
            //   title: S.of(context).fuelType,
            //   hintText: S.of(context).egHybrid,
            //   displayError: state.fuelTypeEntity.displayError ?? "",
            // ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[2],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.engineCapacityChanged(value)),
              title: S.of(context).engineCapacity,
              hintText: S.of(context).eg1984,
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
              textEditingController: textEditingControllerList[3],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.enginePowerChanged(value)),
              title: S.of(context).enginePower,
              hintText: S.of(context).eg163,
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
