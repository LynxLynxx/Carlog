import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/service/service_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class UserServiceBoardWidget extends StatelessWidget {
  const UserServiceBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceBloc, ServiceState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status.isInProgress || state.status.isInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isSuccess) {
          return Padding(
            padding: PaddingsK.h20,
            child: ListView.builder(
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
