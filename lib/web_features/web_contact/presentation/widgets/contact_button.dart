import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/web_features/web_contact/presentation/cubit/web_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactButton extends StatelessWidget {
  final String sender;
  final String email;
  final String subject;
  final String message;
  final bool isLoading;
  final bool isActive;
  final GlobalKey<FormState> contactFormKey;

  const ContactButton(
      {super.key,
      required this.sender,
      required this.email,
      required this.subject,
      required this.message,
      required this.isLoading,
      required this.isActive,
      required this.contactFormKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingsK.h50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 25),
        child: FilledButton(
          onPressed: isActive
              ? () {
                  bool valid = contactFormKey.currentState!.validate();
                  if (!valid) {
                    return;
                  }
                  context
                      .read<WebContactCubit>()
                      .sendMail(sender, email, subject, message);
                }
              : null,
          child: isLoading
              ? Transform.scale(
                  scale: 0.7,
                  child: const CircularProgressIndicator(
                    strokeWidth: 6,
                  ),
                )
              : const Text("Send"),
        ),
      ),
    );
  }
}
