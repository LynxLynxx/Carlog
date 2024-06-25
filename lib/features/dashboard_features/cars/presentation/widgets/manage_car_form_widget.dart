// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/custom_dropdown_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ManageCarFormWidget extends StatelessWidget {
  final ManageCarBloc addCarBloc;
  final List<TextEditingController> textEditingControllerList;
  ManageCarFormWidget({
    super.key,
    required this.addCarBloc,
    required this.textEditingControllerList,
  });

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageCarBloc, ManageCarState>(
      bloc: addCarBloc,
      listener: (context, state) {
        textEditingControllerList[0].text = addCarBloc.state.brandEntity.value;
        textEditingControllerList[1].text = addCarBloc.state.modelEntity.value;
        textEditingControllerList[2].text = addCarBloc.state.yearEntity.value;
        textEditingControllerList[3].text = addCarBloc.state.milageEntity.value;
        textEditingControllerList[4].text = addCarBloc.state.plateEntity.value;
        textEditingControllerList[5].text =
            addCarBloc.state.typeEntity?.name ?? "";
        textEditingControllerList[6].text =
            addCarBloc.state.fuelTypeEntity?.name ?? "";
        textEditingControllerList[7].text =
            addCarBloc.state.engineCapacityEntity.value;
        textEditingControllerList[8].text =
            addCarBloc.state.enginePowerEntity.value;
        if (state.status.isFailure) {
          SnackbarsK.errorSnackbar(state.message!).show(context);
        }
        if (state.status.isSuccess) {
          SnackbarsK.successSnackbar(state.message!).show(context);
          context.go(RoutesK.cars);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[0],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.brandChanged(value)),
              title: S.of(context).carBrand,
              hintText: S.of(context).egVolvo,
              displayError: state.brandEntity.displayError ?? "",
              isRequired: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[1],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.modelChanged(value)),
              title: S.of(context).carModel,
              hintText: S.of(context).egXC90,
              displayError: state.modelEntity.displayError ?? "",
              isRequired: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[2],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.yearChanged(value)),
              title: S.of(context).yearOfProduction,
              hintText: S.of(context).eg2024,
              isRequired: true,
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              displayError: state.yearEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[3],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.milageChanged(value)),
              title: S.of(context).milage,
              hintText: S.of(context).eg10000,
              isRequired: true,
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
              displayError: state.milageEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[4],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.plateChanged(value)),
              title: S.of(context).plate,
              hintText: S.of(context).egAUM550,
              displayError: state.plateEntity.displayError ?? "",
            ),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[7],
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
              textEditingController: textEditingControllerList[8],
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
