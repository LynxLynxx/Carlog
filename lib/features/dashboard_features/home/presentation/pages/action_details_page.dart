import 'package:carlog/core/constants/formats.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/address_picker_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/custom_dropdown_action_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/date_picker_widget.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ActionDetailsPage extends StatelessWidget {
  final String carId;
  final String actionId;
  final String carActionId;
  final CarActionEntity carActionEntity;
  const ActionDetailsPage({
    super.key,
    required this.actionId,
    required this.carActionId,
    required this.carActionEntity,
    required this.carId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageActionBloc(locator(), locator(), locator(),
          context.read<ActionBloc>(), context.read<UserAppBloc>()),
      child: ActionDetailsView(
        carActionEntity: carActionEntity,
        actionId: actionId,
        carId: carId,
      ),
    );
  }
}

class ActionDetailsView extends StatefulWidget {
  final String actionId;
  final String carId;
  final CarActionEntity carActionEntity;
  const ActionDetailsView(
      {super.key,
      required this.carActionEntity,
      required this.actionId,
      required this.carId});

  @override
  State<ActionDetailsView> createState() => _ActionDetailsViewState();
}

class _ActionDetailsViewState extends State<ActionDetailsView> {
  final addressEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  final noteEditingController = TextEditingController();

  @override
  void initState() {
    context
        .read<ManageActionBloc>()
        .add(ManageActionEvent.setInitialData(widget.carActionEntity));
    addressEditingController.text = widget.carActionEntity.address ?? "";
    dateEditingController.text = widget.carActionEntity.timestamp != null
        ? FormatsK.yyyyMMdd.format(widget.carActionEntity.timestamp!)
        : "";
    noteEditingController.text = widget.carActionEntity.note ?? "";
    super.initState();
  }

  @override
  void dispose() {
    addressEditingController.dispose();
    dateEditingController.dispose();
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
        title: S.of(context).manageActions,
        body: BlocConsumer<ManageActionBloc, ManageActionState>(
          listener: (context, state) {
            addressEditingController.text = state.address.value;
            dateEditingController.text =
                state.date != null ? FormatsK.yyyyMMdd.format(state.date!) : "";
            noteEditingController.text = state.note.value;
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: PaddingsK.all16,
                    child: Column(
                      children: [
                        const CustomDropdownActionWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        state.action != CarActionEnum.note
                            ? Column(
                                children: [
                                  AddressPickerWidget(
                                      textEditingController:
                                          addressEditingController,
                                      state: state),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                        DatePickerWidget(
                            textEditingController: dateEditingController,
                            state: state),
                        ListElementTextfieldWidget(
                            textEditingController: noteEditingController,
                            func: (value) {
                              context
                                  .read<ManageActionBloc>()
                                  .add(ManageActionEvent.changeNote(value));
                            },
                            maxLines: 6,
                            title: S.of(context).note,
                            hintText: S.of(context).egRememberToChangeTheOil,
                            displayError: state.note.displayError ?? ""),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomWidget: BlocSelector<ManageActionBloc, ManageActionState, bool>(
          selector: (state) {
            return state.status.isInProgress;
          },
          builder: (context, state) {
            final manageActionState = context.watch<ManageActionBloc>().state;
            return CarlogBottomButtonWidget(
              title: S.of(context).save,
              isLoading: state,
              isActive: manageActionState.action != CarActionEnum.note
                  ? manageActionState.address.value.isNotEmpty &&
                      manageActionState.date != null
                  : manageActionState.date != null,
              onTap: () {
                context.read<ManageActionBloc>().add(
                    ManageActionEvent.updateActionEvent(
                        widget.carId, widget.actionId, widget.carActionEntity));
                context.pop();
              },
            );
          },
        ),
      ),
    );
  }
}
