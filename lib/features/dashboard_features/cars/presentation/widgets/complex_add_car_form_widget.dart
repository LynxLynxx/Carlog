// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/complex_add_car_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ComplexAddCarFormWidget extends StatelessWidget {
  final ManageCarStatus manageCarStatus;
  final AddCarBloc addCarBloc;
  ComplexAddCarFormWidget({
    super.key,
    required this.manageCarStatus,
    required this.addCarBloc,
  });

  FocusNode f1 = FocusNode();
  final tec1 = TextEditingController();

  FocusNode f2 = FocusNode();
  final tec2 = TextEditingController();

  FocusNode f3 = FocusNode();
  final tec3 = TextEditingController();

  FocusNode f4 = FocusNode();
  final tec4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCarBloc, AddCarState>(
      bloc: addCarBloc,
      listener: (context, state) {
        tec1.text = addCarBloc.state.brandEntity.value;
        tec2.text = addCarBloc.state.modelEntity.value;
        tec3.text = addCarBloc.state.yearEntity.value;
        tec4.text = addCarBloc.state.plateEntity.value;
        if (state.status.isFailure) {
          SnackbarsK.errorSnackbar(state.message!).show(context);
        }
        if (state.status.isSuccess) {
          SnackbarsK.successSnackbar(state.message!).show(context);
          context.pop();
        }
      },
      builder: (context, state) {
        final bloc = context.read<AddCarBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: const Key("brand_field"),
              controller: tec1,
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
                  .read<AddCarBloc>()
                  .add(AddCarEvent.brandChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("model_field"),
              controller: tec2,
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
                  .read<AddCarBloc>()
                  .add(AddCarEvent.modelChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("year_field"),
              controller: tec3,
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
                  .read<AddCarBloc>()
                  .add(AddCarEvent.yearChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              key: const Key("plate_field"),
              controller: tec4,
              autocorrect: false,
              decoration: authTextFormFieldInputDecoration(
                  context, bloc.state.plateEntity.displayError, "Plate",
                  errorMaxLine: 2),
              textInputAction: TextInputAction.go,
              focusNode: f4,
              onEditingComplete: () {
                f4.unfocus();
                context
                    .read<AddCarBloc>()
                    .add(const AddCarEvent.addCarSubmitted());
              },
              onChanged: (value) => context
                  .read<AddCarBloc>()
                  .add(AddCarEvent.plateChanged(value)),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocSelector<AddCarBloc, AddCarState, bool>(
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
                              .read<AddCarBloc>()
                              .add(const AddCarEvent.addCarSubmitted())
                          : context
                              .read<AddCarBloc>()
                              .add(const AddCarEvent.editCarSubmitted())
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
