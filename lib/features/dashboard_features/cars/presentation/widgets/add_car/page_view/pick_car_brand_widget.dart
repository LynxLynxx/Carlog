import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/custom_alphabet_scroll.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickCarBrandWidget extends StatefulWidget {
  const PickCarBrandWidget({super.key});

  @override
  State<PickCarBrandWidget> createState() => _PickCarBrandWidgetState();
}

class _PickCarBrandWidgetState extends State<PickCarBrandWidget> {
  bool isManually = false;

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
                  child: CustomAlphabetScroll(
                    list: carList,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Unable to locate your brand?",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: context.onPrimaryContainer),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isManually = true;
                    context.read<ManageCarBloc>().add(
                        const ManageCarEvent.brandChanged(""));
                  }),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Enter it manually!",
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
                      .add(ManageCarEvent.brandChanged(value)),
                  title: "Car Brand",
                  hintText: "e.g. Volvo",
                  isRequired: true,
                  displayError: state.brandEntity.displayError ?? "",
                  funcClose: () => setState(() {
                    isManually = false;
                    context
                        .read<ManageCarBloc>()
                        .add(const ManageCarEvent.brandChanged(""));
                  }),
                );
              },
            ),
    );
  }
}
