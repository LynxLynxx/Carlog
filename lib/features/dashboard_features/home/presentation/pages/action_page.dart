import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/action/custom_dropdown_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/custom_appbar.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ActionPage extends StatelessWidget {
  final BuildContext appContext;
  const ActionPage({super.key, required this.appContext});

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
            textEditingControllerList[0].text = state.address.value;
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBar(title: S.of(context).addAction),
                Padding(
                  padding: PaddingsK.all16,
                  child: Column(
                    children: [
                      const CustomDropdownWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListElementTextfieldWidget(
                                textEditingController:
                                    textEditingControllerList[0],
                                func: (value) {
                                  context.read<ManageActionBloc>().add(
                                      ManageActionEvent.changeAddress(value));
                                  context.read<ManageActionBloc>().add(
                                      ManageActionEvent.changeLatitude(value));
                                  context.read<ManageActionBloc>().add(
                                      ManageActionEvent.changeLongitude(value));
                                },
                                title: S.of(context).address,
                                hintText: S.of(context).egWalkway,
                                displayError: state.address.displayError ?? ""),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    context.push(RoutesK.map, extra: context),
                                child: Container(
                                  padding: PaddingsK.all4,
                                  width: 40,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    ImagesK.map,
                                    colorFilter: ColorFilter.mode(
                                        context.primaryColor, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () =>
                //   child: const Text("Map"),
                // ),
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
              context.pop();
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
