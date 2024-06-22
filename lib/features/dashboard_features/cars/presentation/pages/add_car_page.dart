import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/basic_add_car/basic_add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/page_view/pick_car_brand_widget.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/page_view/pick_car_model_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class AddCarPage extends StatelessWidget {
  final BuildContext appContext;
  const AddCarPage({super.key, required this.appContext});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BasicAddCarBloc(),
        ),
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
  final int _step = 50;
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
    _page++;
    _controller.animateTo(nextValue, duration: DurationsK.d1000);
    _pageController.animateToPage(_page,
        duration: DurationsK.d350, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Text(
                    S.of(context).addCar,
                    style: text22W700LS3,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.95,
                child: Padding(
                  padding: PaddingsK.h20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        builder: (context, value, _) => LinearProgressIndicator(
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
                          children: const [
                            PickCarBrandWidget(),
                            PickCarModelWidget(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocSelector<ManageCarBloc, ManageCarState, bool>(
        selector: (state) {
          return state.brandEntity.value.isNotEmpty;
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: state
                ? () {
                    _animateToNextFrame();
                  }
                : null,
            shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular30),
            backgroundColor: context.primaryColor,
            child: SvgPicture.asset(
              ImagesK.arrowForward,
              colorFilter: ColorFilter.mode(context.onPrimary, BlendMode.srcIn),
            ),
          );
        },
      ),
    );
  }
}
