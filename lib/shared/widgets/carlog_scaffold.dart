import 'package:flutter/material.dart';

class CarlogScaffold extends StatelessWidget {
  final Widget body;
  final String? _title;
  final SliverAppBar? _appBar;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomWidget;

  const CarlogScaffold.title({
    super.key,
    required String title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomWidget,
  })  : _appBar = null,
        _title = title;
  const CarlogScaffold.appbar({
    super.key,
    required appBar,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomWidget,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          buildAppbar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: body,
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomWidget,
    );
  }
}
