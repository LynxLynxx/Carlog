import 'package:flutter/material.dart';

class ConnectByService extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final String title;
  final String asset;
  const ConnectByService({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.title,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        // width: 0.2.sw,
        height: 60,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: !isLoading
                ? Image.asset(
                    asset,
                    width: 30,
                    height: 30,
                  )
                : SizedBox(
                    width: 30,
                    height: 30,
                    child: Transform.scale(
                      scale: 0.85,
                      child: const CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
