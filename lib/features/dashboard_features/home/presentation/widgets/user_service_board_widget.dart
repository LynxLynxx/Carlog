import 'package:flutter/material.dart';

class UserServiceBoardWidget extends StatelessWidget {
  const UserServiceBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stepper(steps: const [
      Step(
        title: Text(''),
        content: Text('Content for Step 1'),
      ),
      Step(
        title: Text('Step 2'),
        content: Text('Content for Step 2'),
      ),
      Step(
        title: Text('Step 3'),
        content: Text('Content for Step 3'),
      ),
    ]);
  }
}
