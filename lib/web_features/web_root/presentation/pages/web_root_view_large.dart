import 'package:carlog/web_features/web_contact/presentation/pages/web_contact_view_large.dart';
import 'package:carlog/web_features/web_home/presentation/pages/web_home_view_large.dart';
import 'package:carlog/web_features/web_request_feature/presentation/pages/web_request_feature_page.dart';
import 'package:carlog/web_features/web_root/presentation/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebRootViewLarge extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  WebRootViewLarge({super.key, required this.navigationShell});

  final PageController pageController = PageController(initialPage: 1);

  List<Widget> get pages => [
        WebContactViewLarge(),
        const WebHomeViewLarge(),
        const WebRequestFeaturePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPageView(),
          Align(
              alignment: Alignment.topCenter,
              child: CustomAppBar(
                navigationShell: navigationShell,
                pageController: pageController,
              )),
        ],
      ),
    );
  }

  Widget _buildPageView() => PageView.builder(
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: pages.length,
        // physics: const NeverScrollableScrollPhysics(),
        // onPageChanged: (value) {
        //   if (!manualChange) {
        //     Instances.navigationShell!.goBranch(value);
        //     context
        //         .read<ApplicationBloc>()
        //         .add(ApplicationEvent.changeIndex(value));
        //   }
        // },
        itemBuilder: (context, index) => pages[index],
      );
}
