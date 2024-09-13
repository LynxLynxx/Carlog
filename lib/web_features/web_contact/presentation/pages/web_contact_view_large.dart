import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/web_features/web_contact/presentation/cubit/web_contact_cubit.dart';
import 'package:carlog/web_features/web_contact/presentation/widgets/contact_button.dart';
import 'package:carlog/web_features/web_contact/presentation/widgets/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebContactViewLarge extends StatelessWidget {
  WebContactViewLarge({super.key});

  final TextEditingController senderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final contactGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildRectangle(),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: PaddingsK.h30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Us",
                          style: context.headlineMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Feel free to reach out to us at any time, and we’ll get back to you as quickly as possible. Your questions and feedback are important to us!",
                          style: context.titleMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocConsumer<WebContactCubit, WebContactState>(
                          listener: (context, state) {
                            state.maybeWhen(
                                orElse: () {},
                                data: () {
                                  senderController.clear();
                                  emailController.clear();
                                  subjectController.clear();
                                  messageController.clear();
                                });
                          },
                          builder: (context, state) {
                            return AnimatedSwitcher(
                              duration: DurationsK.d500,
                              child: state.when(
                                initial: () => Column(
                                  children: [
                                    ContactForm(
                                        senderController: senderController,
                                        emailController: emailController,
                                        subjectController: subjectController,
                                        messageController: messageController,
                                        contactGlobalKey: contactGlobalKey),
                                    ContactButton(
                                        sender: senderController,
                                        email: emailController,
                                        subject: subjectController,
                                        message: messageController,
                                        isLoading: false,
                                        isActive: true,
                                        contactFormKey: contactGlobalKey),
                                  ],
                                ),
                                loading: () => Column(
                                  children: [
                                    ContactForm(
                                        senderController: senderController,
                                        emailController: emailController,
                                        subjectController: subjectController,
                                        messageController: messageController,
                                        contactGlobalKey: contactGlobalKey),
                                    ContactButton(
                                        sender: senderController,
                                        email: emailController,
                                        subject: subjectController,
                                        message: messageController,
                                        isLoading: true,
                                        isActive: false,
                                        contactFormKey: contactGlobalKey)
                                  ],
                                ),
                                failure: (failure) => Column(
                                  children: [
                                    ContactForm(
                                        senderController: senderController,
                                        emailController: emailController,
                                        subjectController: subjectController,
                                        messageController: messageController,
                                        contactGlobalKey: contactGlobalKey),
                                    ContactButton(
                                        sender: senderController,
                                        email: emailController,
                                        subject: subjectController,
                                        message: messageController,
                                        isLoading: false,
                                        isActive: true,
                                        contactFormKey: contactGlobalKey),
                                  ],
                                ),
                                data: () => Text(
                                    "Your message has been sent successfully!",
                                    style: context.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
              const Expanded(flex: 5, child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRectangle() => Align(
      alignment: Alignment.topRight,
      child: Image.asset(ImagesK.backgroundLeft));
}
