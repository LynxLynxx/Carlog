import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/custom_dropdown_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageActionBloc(locator(), locator()),
        ),
      ],
      child: ActionView(),
    );
  }
}

class ActionView extends StatelessWidget {
  ActionView({super.key});

  final List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ManageActionBloc, ManageActionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back_ios)),
                    Expanded(
                      child: Text(
                        S.of(context).addAction,
                        style: context.titleLarge!.copyWith(
                          color: context.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: PaddingsK.all16,
                  child: Column(
                    children: [
                      const CustomDropdownWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      ListElementTextfieldWidget(
                          textEditingController: textEditingControllerList[0],
                          func: (value) {
                            context
                                .read<ManageActionBloc>()
                                .add(ManageActionEvent.changeAddress(value));
                            context
                                .read<ManageActionBloc>()
                                .add(ManageActionEvent.changeLatitude(value));
                            context
                                .read<ManageActionBloc>()
                                .add(ManageActionEvent.changeLongitude(value));
                          },
                          title: S.of(context).address,
                          hintText: S.of(context).egWalkway,
                          displayError: state.address.displayError ?? ""),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
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
          return FloatingActionButton(
            onPressed: () {
              context
                  .read<ManageActionBloc>()
                  .add(const ManageActionEvent.submitActionEvent());
            },
            shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular30),
            backgroundColor: context.primaryColor,
            child: SvgPicture.asset(
              ImagesK.save,
              colorFilter: ColorFilter.mode(context.onPrimary, BlendMode.srcIn),
            ),
          );
        },
      ),
    );
  }
}
