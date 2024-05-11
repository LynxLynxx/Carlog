import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({
    super.key,
  });

  @override
  State<ResetPasswordFormWidget> createState() => _LoginByMailFormWidgetState();
}

class _LoginByMailFormWidgetState extends State<ResetPasswordFormWidget> {
  FocusNode f1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          context
            ..pop()
            ..push(RoutesK.linkSent);
        }
      },
      builder: (context, state) {
        final bloc = context.read<ResetPasswordBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              key: const Key("mail_field"),
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.mail.displayError ?? bloc.state.errorMessage,
                "Email",
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
                context
                    .read<ResetPasswordBloc>()
                    .add(const ResetPasswordEvent.submit());
              },
              onChanged: (value) => context
                  .read<ResetPasswordBloc>()
                  .add(ResetPasswordEvent.emailChange(value)),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () => context
                  .read<ResetPasswordBloc>()
                  .add(const ResetPasswordEvent.submit()),
              child: const Text("Wyślij kod"),
            ),
          ],
        );
      },
    );
  }
}
