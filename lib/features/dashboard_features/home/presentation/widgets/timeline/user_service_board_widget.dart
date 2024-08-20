import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

class UserServiceBoardWidget extends StatelessWidget {
  const UserServiceBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActionBloc, ActionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status.isInProgress || state.status.isInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isSuccess) {
          if (state.carActionDayEntity.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(AnimationsK.emptyCalendar),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
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
              ],
            );
          }
          return Padding(
            padding: PaddingsK.h20,
            child: ListView.builder(
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
