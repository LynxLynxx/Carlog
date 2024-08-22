import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/manage_car_form_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ManageCarPage extends StatelessWidget {
  final CarFirebaseEntity carFirebaseEntity;
  final BuildContext appContext;

  const ManageCarPage(
      {super.key, required this.carFirebaseEntity, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ManageCarBloc(
          locator(),
          appContext.read<CarsBloc>(),
        );
        bloc.add(ManageCarEvent.setInitialCar(carFirebaseEntity));
        return bloc;
      },
      child: ManageCarView(
        appContext: appContext,
      ),
    );
  }
}

class ManageCarView extends StatefulWidget {
  final CarFirebaseEntity? carFirebaseEntity;
  final BuildContext appContext;

  const ManageCarView(
      {super.key, this.carFirebaseEntity, required this.appContext});

  @override
  State<ManageCarView> createState() => _ManageCarViewState();
}

class _ManageCarViewState extends State<ManageCarView> {
  final tec1 = TextEditingController();
  final tec2 = TextEditingController();
  final tec3 = TextEditingController();
  final tec4 = TextEditingController();
  final tec5 = TextEditingController();
  final tec6 = TextEditingController();
  final tec7 = TextEditingController();
  final tec8 = TextEditingController();
  final tec9 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: Text(
                      S.of(context).updateCar,
                      style: text22W700LS3,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.push(
                        RoutesK.deleteCarConfirmation.fullPath,
                        extra: context),
                    icon: SvgPicture.asset(
                      ImagesK.delete,
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
              Padding(
                padding: PaddingsK.all16,
                child: ManageCarFormWidget(
                  addCarBloc: context.read<ManageCarBloc>(),
                  textEditingControllerList: [
                    tec1,
                    tec2,
                    tec3,
                    tec4,
                    tec5,
                    tec6,
                    tec7,
                    tec8,
                    tec9
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocSelector<ManageCarBloc, ManageCarState, bool>(
        selector: (state) {
          return state.brandEntity.value.isNotEmpty &&
              state.modelEntity.value.isNotEmpty &&
              state.yearEntity.value.isNotEmpty &&
              state.plateEntity.value.isNotEmpty;
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context
                  .read<ManageCarBloc>()
                  .add(const ManageCarEvent.editCarSubmitted());
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
