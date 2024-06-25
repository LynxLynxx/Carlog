import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget {
  final Widget body;
  final String? _title;
  final SliverAppBar? _appBar;
  final List<Widget>? actions;

  const DashboardAppbar.title({
    super.key,
    required String title,
    required this.body,
    this.actions,
  })  : _appBar = null,
        _title = title;
  const DashboardAppbar.appbar({
    super.key,
    required appBar,
    required this.body,
    this.actions,
  })  : _appBar = appBar,
        _title = null;

  String? get title => _title;
  SliverAppBar? get appBar => _appBar;

  Widget buildAppbar(BuildContext context) {
    if (title != null) {
      return SliverAppBar.medium(
        title: Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: actions,
      );
    }
    if (appBar != null) {
      return appBar!;
    }
    return SliverAppBar.medium(
      actions: actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildAppbar(context),
        SliverToBoxAdapter(
          child: body,
        ),
      ],
    );
  }
}
