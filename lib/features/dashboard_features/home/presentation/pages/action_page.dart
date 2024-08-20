import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:flutter/material.dart';

class ActionPage extends StatelessWidget {
  const ActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActionView();
  }
}

class ActionView extends StatelessWidget {
  const ActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListElementTextfieldWidget(
                textEditingController: TextEditingController(),
                func: (value) => {},
                title: "Type",
                hintText: "Hint",
                displayError: "Error")
          ],
        ),
      ),
    );
  }
}
