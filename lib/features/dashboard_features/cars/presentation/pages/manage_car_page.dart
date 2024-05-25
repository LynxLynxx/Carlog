import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/manage_car_form_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

enum ManageCarStatus { add, edit }

class ManageCarPage extends StatelessWidget {
  final ManageCarStatus manageCarStatus;
  final CarFirebaseEntity? carFirebaseEntity;
  final BuildContext appContext;

  const ManageCarPage(
      {super.key,
      this.manageCarStatus = ManageCarStatus.add,
      this.carFirebaseEntity,
      required this.appContext});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AddCarBloc(
          locator(),
          appContext.read<CarsBloc>(),
        );
        if (manageCarStatus == ManageCarStatus.edit) {
          bloc.add(AddCarEvent.setInitialCar(carFirebaseEntity!));
        }
        return bloc;
      },
      child: ManageCarView(
        manageCarStatus: manageCarStatus,
        appContext: appContext,
      ),
    );
  }
}

class ManageCarView extends StatefulWidget {
  final ManageCarStatus manageCarStatus;
  final CarFirebaseEntity? carFirebaseEntity;
  final BuildContext appContext;

  const ManageCarView(
      {super.key,
      required this.manageCarStatus,
      this.carFirebaseEntity,
      required this.appContext});

  @override
  State<ManageCarView> createState() => _ManageCarViewState();
}

class _ManageCarViewState extends State<ManageCarView> {
  final tec1 = TextEditingController();

  final tec2 = TextEditingController();

  final tec3 = TextEditingController();

  final tec4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Text(
                    widget.manageCarStatus == ManageCarStatus.add
                        ? S.of(context).addCar
                        : S.of(context).updateCar,
                    style: text22W700LS3,
                  ),
                ),
                widget.manageCarStatus == ManageCarStatus.edit
                    ? IconButton(
                        onPressed: () => context.push(
                            RoutesK.deleteCarConfirmation,
                            extra: context),
                        icon: SvgPicture.asset(
                          ImagesK.delete,
                          width: 30,
                          height: 30,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: PaddingsK.all16,
              child: ManageCarFormWidget(
                manageCarStatus: widget.manageCarStatus,
                addCarBloc: context.read<AddCarBloc>(),
                textEditingControllerList: [tec1, tec2, tec3, tec4],
              ),
            )
          ],
        ),
      ),
    );
  }
}
