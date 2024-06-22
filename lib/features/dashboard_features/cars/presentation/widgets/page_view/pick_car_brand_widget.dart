import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/custom_alphabet_scroll.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/page_view/pick_car_brand_manually_widget.dart';
import 'package:flutter/material.dart';

class PickCarBrandWidget extends StatefulWidget {
  const PickCarBrandWidget({super.key});

  @override
  State<PickCarBrandWidget> createState() => _PickCarBrandWidgetState();
}

class _PickCarBrandWidgetState extends State<PickCarBrandWidget> {
  bool isManually = false;

  @override
  Widget build(BuildContext context) {
    final carList = CarEntity.fromMap(JsonsK.cars);

    return AnimatedSwitcher(
      duration: DurationsK.d500,
      child: !isManually
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
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
          : PickCarBrandManuallyWidget(
              textEditingController: TextEditingController()),
    );
  }
}
