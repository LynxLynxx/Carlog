import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/timeline_widget.dart';
import 'package:carlog/shared/widgets/carlog_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class UserActionBoardWidget extends StatelessWidget {
  const UserActionBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActionBloc, ActionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status.isInProgress || state.status.isInitial) {
          return const CarlogLoader();
        }
        if (state.status.isSuccess) {
          if (state.carActionDayEntity.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                LottieBuilder.asset(AnimationsK.emptyCalendar),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () => context.push(RoutesK.addAction, extra: context),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: PaddingsK.h30v10,
                      child: Card(
                        child: Container(
                            margin: PaddingsK.all16,
                            child: const Icon(Icons.add)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Padding(
            padding: PaddingsK.h20,
            child: ListView.builder(
              shrinkWrap: true,
              padding: PaddingsK.v20,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => TimelineWidget(
                isFirst: index == 0,
                isLast: index == state.carActionDayEntity.length - 1,
                carActionDayEntity: state.carActionDayEntity[index],
              ),
              itemCount: state.carActionDayEntity.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
