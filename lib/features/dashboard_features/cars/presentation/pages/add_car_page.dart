import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/car_button_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/cars_app_bar_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/page_view/congratulations_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/page_view/pick_car_brand_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/page_view/pick_car_main_data_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/page_view/pick_car_model_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/page_view/pick_car_submain_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';

class AddCarPage extends StatelessWidget {
  final BuildContext appContext;
  const AddCarPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageCarBloc(
            locator(),
            appContext.read<CarsBloc>(),
          ),
        ),
      ],
      child: const AddCarView(),
    );
  }
}

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  late AnimationController animationController;

  late final AnimationController _controller;
  int _currentFrame = 0;
  int _page = 0;
  final int _step = 63;
  final int _totalFrames = 251;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {
          _currentFrame = (_controller.value * _totalFrames).round();
        });
      });
  }

  void _animateToNextFrame() {
    final nextFrame = (_currentFrame + _step).clamp(0, _totalFrames);
    final nextValue = nextFrame / _totalFrames;

    _controller.animateTo(nextValue, duration: DurationsK.d1000);
    _page++;
    _page != 5
        ? _pageController.animateToPage(_page,
            duration: DurationsK.d350, curve: Curves.linear)
        : null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  final List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<ManageCarBloc, ManageCarState>(
          listener: (context, state) {
            if (state.status.isFailure) {}
            if (state.status.isSuccess) {
              _animateToNextFrame();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarsAppBarWidget(
                  page: _page, func: _animateToNextFrame, context: context),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Padding(
                    padding: PaddingsK.h20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 130,
                          child: LottieBuilder.asset(
                            AnimationsK.paintCar,
                            controller: _controller,
                            onLoaded: (composition) {
                              _controller.duration = composition.duration;
                            },
                          ),
                        ),
                        TweenAnimationBuilder<double>(
                          duration: Durations.long1,
                          curve: Curves.easeInOut,
                          tween: Tween<double>(
                            begin: 0,
                            end: 1,
                          ),
                          builder: (context, value, _) =>
                              LinearProgressIndicator(
                            value: _currentFrame / _totalFrames,
                            borderRadius: PaddingsK.circular30,
                            backgroundColor: context.outlineVariant,
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const PickCarBrandWidget(),
                              const PickCarModelWidget(),
                              PickCarMainDataWidget(
                                textEditingControllerList: [
                                  textEditingControllerList[0],
                                  textEditingControllerList[1],
                                  textEditingControllerList[2],
                                ],
                              ),
                              PickCarSubMainDataWidget(
                                textEditingControllerList: [
                                  textEditingControllerList[3],
                                  textEditingControllerList[4],
                                  textEditingControllerList[5],
                                  textEditingControllerList[6],
                                ],
                              ),
                              const CongratulationsWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CarButtonWidget(
        page: _page,
      ),
    );
  }
}
