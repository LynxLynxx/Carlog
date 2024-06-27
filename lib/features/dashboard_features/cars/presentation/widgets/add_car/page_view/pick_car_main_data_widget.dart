import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PickCarMainDataWidget extends StatelessWidget {
  final List<TextEditingController> textEditingControllerList;
  const PickCarMainDataWidget(
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
              textEditingController: textEditingControllerList[1],
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
              textEditingController: textEditingControllerList[2],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.plateChanged(value)),
              title: S.of(context).plate,
              hintText: S.of(context).egAUM550,
              displayError: state.plateEntity.displayError ?? "",
            ),
          ],
        );
      },
    );
  }
}
