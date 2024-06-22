import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/list_element_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class PickCarMainDataWidget extends StatelessWidget {
  final List<TextEditingController> textEditingControllerList;
  const PickCarMainDataWidget(
      {super.key, required this.textEditingControllerList});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageCarBloc, ManageCarState>(
      listener: (context, state) {
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
                  .add(ManageCarEvent.yearChanged(value)),
              title: "Year of production",
              hintText: "e.g. 2024",
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListElementTextfieldWidget(
              textEditingController: textEditingControllerList[1],
              func: (value) => context
                  .read<ManageCarBloc>()
                  .add(ManageCarEvent.milageChanged(value)),
              title: "Milage",
              hintText: "e.g. 10 000",
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(7),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListElementTextfieldWidget(
                textEditingController: textEditingControllerList[2],
                func: (value) => context
                    .read<ManageCarBloc>()
                    .add(ManageCarEvent.plateChanged(value)),
                title: "Plate",
                hintText: "e.g. AUM 550"),
            const SizedBox(
              height: 30,
            ),
          ],
        );
      },
    );
  }
}
