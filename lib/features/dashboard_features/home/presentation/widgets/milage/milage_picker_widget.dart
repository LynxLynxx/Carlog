import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddressPickerWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ManageActionState state;
  const AddressPickerWidget({super.key, required this.textEditingController, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListElementTextfieldWidget(
              textEditingController: textEditingController,
              func: (value) {
                context
                    .read<ManageActionBloc>()
                    .add(ManageActionEvent.changeAddress(value));
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
              onTap: () => context.push(RoutesK.map, extra: context),
              child: Container(
                padding: PaddingsK.all4,
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  ImagesK.map,
                  colorFilter:
                      ColorFilter.mode(context.primaryColor, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
