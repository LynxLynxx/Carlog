import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/web_features/web_contact/presentation/cubit/web_contact_cubit.dart';
import 'package:carlog/web_features/web_contact/presentation/widgets/contact_button.dart';
import 'package:carlog/web_features/web_contact/presentation/widgets/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
                  flex: 6,
                  child: Container(
                    padding: PaddingsK.h50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).contactUs,
                          style: context.headlineMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).feelFreeToReachOut,
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
                                    S.of(context).yourMessageHasBeenSent,
                                    style: context.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: LottieBuilder.asset(
                    AnimationsK.contact,
                    width: 300,
                    height: MediaQuery.of(context).size.height * 0.7,
                  )),
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
