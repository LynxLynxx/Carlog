import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/theme/styles/dot_styles.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/bloc/tutorial/tutorial_bloc.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/bloc/tutorial_index/tutorial_index_bloc.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/widgets/tutorial_column_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TutorialIndexBloc(),
      child: TutorialView(),
    );
  }
}

class TutorialView extends StatelessWidget {
  TutorialView({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TutorialIndexBloc, TutorialIndexState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 550,
                  child: PageView(
                    controller: pageController,
                    children: const [
                      TutorialColumnWidget(id: 0),
                      TutorialColumnWidget(id: 1),
                      TutorialColumnWidget(id: 2),
                    ],
                    onPageChanged: (value) {
                      context.read<TutorialIndexBloc>().add(
                            TutorialIndexEvent.changeIndex(value),
                          );
                    },
                  ),
                ),
                const Spacer(),
                DotsIndicator(
                  dotsCount: 3,
                  decorator: dotsDecorator(context),
                  position: state.index,
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: () {
                    if (state.index < 2) {
                      pageController.animateToPage(state.index + 1,
                          duration: DurationsK.d500, curve: Curves.decelerate);
                    } else {
                      context
                          .read<TutorialBloc>()
                          .add(const TutorialEvent.writeFirstEntryToApp());
                    }
                  },
                  child: Padding(
                    padding: PaddingsK.h10,
                    child: Text(
                      state.index < 2 ? "Next" : "Get started",
                      style: text16W500LS1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
