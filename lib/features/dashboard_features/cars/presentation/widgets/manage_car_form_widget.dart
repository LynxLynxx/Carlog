// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/manage_car_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ManageCarFormWidget extends StatelessWidget {
  final ManageCarStatus manageCarStatus;
  final ManageCarBloc addCarBloc;
  final List<TextEditingController> textEditingControllerList;
  ManageCarFormWidget({
    super.key,
    required this.manageCarStatus,
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
        textEditingControllerList[3].text = addCarBloc.state.plateEntity.value;
        if (state.status.isFailure) {
          SnackbarsK.errorSnackbar(state.message!).show(context);
        }
        if (state.status.isSuccess) {
          SnackbarsK.successSnackbar(state.message!).show(context);
          context.go(RoutesK.cars);
        }
      },
      builder: (context, state) {
        final bloc = context.read<ManageCarBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: const Key("brand_field"),
              controller: textEditingControllerList[0],
              autocorrect: false,
              decoration: authTextFormFieldInputDecoration(
                  context, bloc.state.brandEntity.displayError, "Brand",
                  errorMaxLine: 2),
              textInputAction: TextInputAction.go,
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              onChanged: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.brandChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("model_field"),
              controller: textEditingControllerList[1],
              autocorrect: false,
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.modelEntity.displayError,
                "Model",
                errorMaxLine: 2,
              ),
              textInputAction: TextInputAction.go,
              focusNode: f2,
              onEditingComplete: () {
                f2.unfocus();
                FocusScope.of(context).requestFocus(f3);
              },
              onChanged: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.modelChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("year_field"),
              controller: textEditingControllerList[2],
              autocorrect: false,
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.yearEntity.displayError,
                "Year",
                errorMaxLine: 2,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.go,
              focusNode: f3,
              keyboardType: TextInputType.number,
              onEditingComplete: () {
                f3.unfocus();
                FocusScope.of(context).requestFocus(f4);
              },
              onChanged: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.yearChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("plate_field"),
              controller: textEditingControllerList[3],
              autocorrect: false,
              decoration: authTextFormFieldInputDecoration(
                  context, bloc.state.plateEntity.displayError, "Plate",
                  errorMaxLine: 2),
              textInputAction: TextInputAction.go,
              focusNode: f4,
              onEditingComplete: () {
                f4.unfocus();
                context
                    .read<ManageCarBloc>()
                    .add(const ManageCarEvent.addCarSubmitted());
              },
              onChanged: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.plateChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocSelector<ManageCarBloc, ManageCarState, bool>(
              selector: (state) {
                return state.brandEntity.value.isNotEmpty &&
                    state.modelEntity.value.isNotEmpty &&
                    state.yearEntity.value.isNotEmpty &&
                    state.plateEntity.value.isNotEmpty;
              },
              builder: (context, state) {
                return FilledButton(
                  onPressed: state
                      ? () => manageCarStatus == ManageCarStatus.add
                          ? context
                              .read<ManageCarBloc>()
                              .add(const ManageCarEvent.addCarSubmitted())
                          : context
                              .read<ManageCarBloc>()
                              .add(const ManageCarEvent.editCarSubmitted())
                      : null,
                  child: Text(manageCarStatus == ManageCarStatus.add
                      ? "Create"
                      : "Update"),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
