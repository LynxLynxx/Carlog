import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expense_card_widget.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> allExpenseModal(BuildContext appContext) {
  return showModalBottomSheet(
    showDragHandle: true,
    useRootNavigator: true,
    backgroundColor: appContext.surfaceColor,
    isScrollControlled: true,
    useSafeArea: true,
    context: appContext,
    constraints:
        BoxConstraints(maxHeight: MediaQuery.of(appContext).size.height * 0.85),
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: appContext.read<AnalyticsBloc>(),
        ),
        BlocProvider.value(
          value: appContext.read<UserAppBloc>(),
        ),
      ],
      child: const AllExpenseDialogWidget(),
    ),
  );
}

class AllExpenseDialogWidget extends StatefulWidget {
  const AllExpenseDialogWidget({
    super.key,
  });

  @override
  State<AllExpenseDialogWidget> createState() => _AllExpenseDialogWidgetState();
}

class _AllExpenseDialogWidgetState extends State<AllExpenseDialogWidget> {
  final List<CarExpenseEnum> carExpensesType = [
    CarExpenseEnum.all,
    CarExpenseEnum.insuranceFee,
    CarExpenseEnum.serviceFee,
    CarExpenseEnum.roadFee,
    CarExpenseEnum.carWash,
    CarExpenseEnum.parkingFee,
    CarExpenseEnum.tires,
    CarExpenseEnum.tuning,
    CarExpenseEnum.other,
  ];
  CarExpenseEnum selectedCarExpenseType = CarExpenseEnum.all;

  List<Widget> carExpensesTiles(List<CarExpenseEntity> data) {
    final filteredData = data
        .where((e) => selectedCarExpenseType != CarExpenseEnum.all
            ? e.expense == selectedCarExpenseType
            : true)
        .map((e) => ExpenseCardWidget(
              carExpenseEntity: e,
            ))
        .toList();

    if (filteredData.isEmpty) {
      return [
        const Center(
          child: Text("There are no expenses that we can show"),
        )
      ];
    } else {
      return filteredData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // itemExtent: 150,
                  children: carExpensesType
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.primaryContainer,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: selectedCarExpenseType == e
                                  ? context.primaryContainer
                                  : null,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedCarExpenseType != e) {
                                  setState(() {
                                    selectedCarExpenseType = e;
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  CarExpenseExtension.getCustomName(e),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: selectedCarExpenseType == e
                                          ? FontWeight.bold
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            BlocBuilder<AnalyticsBloc, AnalyticsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  data: (data) => Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: carExpensesTiles(data),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
