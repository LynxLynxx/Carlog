import 'package:carlog/core/constants/formats.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_expense/manage_expense_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/expense/amount_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/expense/custom_dropdown_expense_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/expense/date_picker_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/expense/file_picker_widget.dart';
import 'package:carlog/features/other_features/file/presentation/bloc/file_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ExpensePage extends StatelessWidget {
  final CarExpenseEntity? carExpenseEntity;
  const ExpensePage({
    super.key,
    this.carExpenseEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FileBloc(locator()),
        ),
        BlocProvider(
          create: (context) => ManageExpenseBloc(
              locator(),
              locator(),
              locator(),
              locator(),
              context.read<AnalyticsBloc>(),
              context.read<UserAppBloc>(),
              context.read<CarsBloc>(),
              context.read<FileBloc>()),
        ),
      ],
      child: ExpenseView(
        carExpenseEntity,
      ),
    );
  }
}

class ExpenseView extends StatefulWidget {
  const ExpenseView(this.carExpenseEntity, {super.key});
  final CarExpenseEntity? carExpenseEntity;

  @override
  State<ExpenseView> createState() => _ActionViewState();
}

class _ActionViewState extends State<ExpenseView> {
  final dateEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
  final milageEditingController = TextEditingController();
  final noteEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.carExpenseEntity != null) {
      context
          .read<ManageExpenseBloc>()
          .add(ManageExpenseEvent.editManage(widget.carExpenseEntity!));
    }
  }

  @override
  void dispose() {
    dateEditingController.dispose();
    amountEditingController.dispose();
    milageEditingController.dispose();
    noteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CarlogScaffold.title(
        showAdmobBanner: DateTime.now().second.isEven,
        resizeToAvoidBottomInset: true,
        title: widget.carExpenseEntity == null
            ? S.of(context).addAction
            : S.of(context).editExpense,
        body: SingleChildScrollView(
          child: BlocConsumer<ManageExpenseBloc, ManageExpenseState>(
            listener: (context, state) {
              dateEditingController.text = state.date != null
                  ? FormatsK.yyyyMMdd.format(state.date!)
                  : "";
              amountEditingController.text = state.amount.value;
              milageEditingController.text = state.milage.value;
              noteEditingController.text = state.note.value;
              if (state.status.isSuccess) {
                context.pop();
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: PaddingsK.all16,
                    child: Column(
                      children: [
                        const CustomDropdownExpenseWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        AmountWidget(
                            amountEditingController: amountEditingController,
                            state: state),
                        const SizedBox(
                          height: 10,
                        ),
                        DatePickerWidget(
                            textEditingController: dateEditingController,
                            state: state),
                        const SizedBox(
                          height: 10,
                        ),
                        ListElementTextfieldWidget(
                            textEditingController: milageEditingController,
                            func: (value) {
                              context.read<ManageExpenseBloc>().add(
                                  ManageExpenseEvent.changeMilageEvent(value));
                            },
                            title: S.of(context).milage,
                            hintText: S.of(context).eg10000,
                            textInputType: TextInputType.number,
                            textInputFormatterList: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            displayError: state.amount.displayError ?? ""),
                        const SizedBox(
                          height: 10,
                        ),
                        const FilePickerWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        ListElementTextfieldWidget(
                            textEditingController: noteEditingController,
                            func: (value) {
                              context
                                  .read<ManageExpenseBloc>()
                                  .add(ManageExpenseEvent.changeNote(value));
                            },
                            maxLines: 6,
                            title: S.of(context).note,
                            hintText:
                                S.of(context).egOilFilterReplacementIncluded,
                            displayError: state.note.displayError ?? ""),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomWidget: BlocSelector<ManageExpenseBloc, ManageExpenseState, bool>(
          selector: (state) {
            return state.status.isInProgress;
          },
          builder: (context, state) {
            final manageExpenseState = context.watch<ManageExpenseBloc>().state;
            return CarlogBottomButtonWidget(
              title: S.of(context).save,
              isLoading: state,
              isActive: manageExpenseState.amount.value.isNotEmpty &&
                  manageExpenseState.currency != null &&
                  manageExpenseState.date != null,
              onTap: () {
                context.read<ManageExpenseBloc>().add(
                    ManageExpenseEvent.submitExpenseEvent(
                        update: widget.carExpenseEntity));
              },
            );
          },
        ),
      ),
    );
  }
}
