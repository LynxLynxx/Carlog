import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/milage/milage_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/custom_appbar.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class UpdateMilagePage extends StatelessWidget {
  const UpdateMilagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MilageBloc(
          locator(), context.read<UserAppBloc>(), context.read<CarsBloc>()),
      child: const UpdateMilageView(),
    );
  }
}

class UpdateMilageView extends StatefulWidget {
  const UpdateMilageView({super.key});

  @override
  State<UpdateMilageView> createState() => _UpdateMilageViewState();
}

class _UpdateMilageViewState extends State<UpdateMilageView> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = context.read<UserAppBloc>().state.car!.milage!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<MilageBloc, MilageState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  CustomAppBar(title: S.of(context).updateMilage),
                  Padding(
                    padding: PaddingsK.all16,
                    child: Column(
                      children: [
                        ListElementTextfieldWidget(
                            textEditingController: textEditingController,
                            func: (value) {
                              context
                                  .read<MilageBloc>()
                                  .add(MilageEvent.changeMilage(value));
                            },
                            title: S.of(context).milage,
                            hintText: S.of(context).eg10000,
                            textInputType: TextInputType.number,
                            textInputFormatterList: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            displayError: state.milage.displayError ?? ""),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocSelector<MilageBloc, MilageState, bool>(
          selector: (state) {
            return state.milage.value.isNotEmpty;
          },
          builder: (context, state) {
            return Padding(
              padding: PaddingsK.v10,
              child: FloatingActionButton(
                onPressed: () {
                  context
                      .read<MilageBloc>()
                      .add(const MilageEvent.submitMilageChangeEvent());
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
