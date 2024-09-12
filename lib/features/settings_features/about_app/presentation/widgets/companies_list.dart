import 'package:flutter/material.dart';

class CompaniesListWidget extends StatefulWidget {
  final double width;
  const CompaniesListWidget({super.key, required this.width});

  @override
  State<CompaniesListWidget> createState() => _CompaniesListWidgetState();
}

class _CompaniesListWidgetState extends State<CompaniesListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Offset> _animation =
      Tween<Offset>(begin: Offset.zero, end: Offset(-widget.width * 2.79, 0))
          .animate(_controller);

  final List<String> images = [
    "assets/companies/appwise.png",
    "assets/companies/bodyspace.png",
    "assets/companies/h2b.png",
    "assets/companies/omega.png",
    "assets/companies/paidwork.png",
    "assets/companies/resql.png",
    "assets/companies/speednet.png",
    "assets/companies/appwise.png",
    "assets/companies/bodyspace.png",
    "assets/companies/h2b.png",
    "assets/companies/omega.png",
    "assets/companies/paidwork.png",
    "assets/companies/resql.png",
    "assets/companies/speednet.png",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: widget.width,
            decoration: const BoxDecoration(),
            clipBehavior: Clip.hardEdge,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent
                ],
                stops: [0.01, 0.1, 0.9, 0.99],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: Transform.translate(
                offset: _animation.value,
                child: Row(
                  children: images
                      .map(
                        (element) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child:
                              SizedBox(height: 39, child: Image.asset(element)),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
