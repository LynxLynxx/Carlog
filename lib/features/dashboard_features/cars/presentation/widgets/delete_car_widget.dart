import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class DeleteCarPage extends StatelessWidget {
  final BuildContext appContext;
  const DeleteCarPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: appContext.read<ManageCarBloc>(),
      child: const DeleteCarView(),
    );
  }
}

class DeleteCarView extends StatelessWidget {
  const DeleteCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: PaddingsK.h10,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: PaddingsK.h30v15,
        decoration: BoxDecoration(
            color: context.surfaceColor, borderRadius: PaddingsK.circular10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: LottieBuilder.asset(AnimationsK.delete),
            ),
            AutoSizeText(
              S.of(context).deleteVehicleConfirmation,
              style: text22W700LS3,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: PaddingsK.h20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<ManageCarBloc>()
                          .add(const ManageCarEvent.deleteCarSubmitted());
                      context.pop();
                    },
                    icon: SvgPicture.asset(
                      ImagesK.yes,
                      width: 50,
                      height: 50,
                      colorFilter:
                          const ColorFilter.mode(Colors.green, BlendMode.srcIn),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: SvgPicture.asset(
                      ImagesK.no,
                      width: 50,
                      height: 50,
                      colorFilter: const ColorFilter.mode(
                          Colors.redAccent, BlendMode.srcIn),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
