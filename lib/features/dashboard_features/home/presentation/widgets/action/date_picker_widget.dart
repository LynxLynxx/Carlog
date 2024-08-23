import 'dart:io';

import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DatePickerWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ManageActionState state;
  const DatePickerWidget(
      {super.key, required this.textEditingController, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListElementTextfieldWidget(
              textEditingController: textEditingController,
              func: (value) {},
              onTap: () => Platform.isIOS
                  ? _iOSPicker(context)
                  : _androidPicker(context),
              readOnly: true,
              title: S.of(context).date,
              hintText: S.of(context).eg20240101,
              displayError: ""),
        ),
        Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Platform.isIOS ? _iOSPicker(context) : _androidPicker(context);
              },
              child: Container(
                padding: PaddingsK.all4,
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  ImagesK.calendarSvg,
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

  _iOSPicker(BuildContext context) => showCupertinoModalPopup(
        context: context,
        builder: (_) => Center(
          child: Container(
            height: 300,
            padding: PaddingsK.all16,
            margin: PaddingsK.all16,
            decoration: BoxDecoration(
                color: context.surfaceBright,
                borderRadius: BorderRadius.circular(10)),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) => context
                  .read<ManageActionBloc>()
                  .add(ManageActionEvent.changeDate(newDate)),
            ),
          ),
        ),
      );

  _androidPicker(BuildContext context) => showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              firstDate: DateTime(2020),
              lastDate: DateTime(2050))
          .then(
        (pickedDate) {
          if (pickedDate == null) return;
          context
              .read<ManageActionBloc>()
              .add(ManageActionEvent.changeDate(pickedDate));
        },
      );
}
