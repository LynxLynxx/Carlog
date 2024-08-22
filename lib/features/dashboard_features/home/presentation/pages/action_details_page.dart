import 'package:carlog/core/constants/formats.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/address_picker_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/custom_dropdown_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/date_picker_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActionDetailsPage extends StatelessWidget {
  final String actionId;
  final CarActionEntity carActionEntity;
  const ActionDetailsPage(
      {super.key, required this.actionId, required this.carActionEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ManageActionBloc(locator(), locator(), context.read<ActionBloc>()),
      child: ActionDetailsView(
        carActionEntity: carActionEntity,
      ),
    );
  }
}

class ActionDetailsView extends StatefulWidget {
  final CarActionEntity carActionEntity;
  const ActionDetailsView({super.key, required this.carActionEntity});

  @override
  State<ActionDetailsView> createState() => _ActionDetailsViewState();
}

class _ActionDetailsViewState extends State<ActionDetailsView> {
  final List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    textEditingControllerList[0].text = widget.carActionEntity.address ?? "";
    textEditingControllerList[1].text = widget.carActionEntity.timestamp != null
        ? FormatsK.yyyyMMdd.format(widget.carActionEntity.timestamp!)
        : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CarlogScaffold.title(
        title: S.of(context).addAction,
        body: BlocConsumer<ManageActionBloc, ManageActionState>(
          listener: (context, state) {
            textEditingControllerList[0].text = state.address.value;
            textEditingControllerList[1].text =
                state.date != null ? FormatsK.yyyyMMdd.format(state.date!) : "";
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: PaddingsK.all16,
                  child: Column(
                    children: [
                      const CustomDropdownWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      AddressPickerWidget(
                          textEditingController: textEditingControllerList[0],
                          state: state),
                      const SizedBox(
                        height: 10,
                      ),
                      DatePickerWidget(
                          textEditingController: textEditingControllerList[1],
                          state: state),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            BlocSelector<ManageActionBloc, ManageActionState, bool>(
          selector: (state) {
            return state.address.value.isNotEmpty &&
                state.latitude.value.isNotEmpty &&
                state.longitude.value.isNotEmpty;
          },
          builder: (context, state) {
            return Padding(
              padding: PaddingsK.v10,
              child: FloatingActionButton(
                onPressed: () {
                  context
                      .read<ManageActionBloc>()
                      .add(const ManageActionEvent.submitActionEvent());
                  context.pop();
                },
                shape:
                    RoundedRectangleBorder(borderRadius: PaddingsK.circular30),
                backgroundColor: context.primaryColor,
                child: SvgPicture.asset(
                  ImagesK.save,
                  colorFilter:
                      ColorFilter.mode(context.onPrimary, BlendMode.srcIn),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
