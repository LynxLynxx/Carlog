import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/mail_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginByMailFormWidget extends StatefulWidget {
  const LoginByMailFormWidget({
    super.key,
  });

  @override
  State<LoginByMailFormWidget> createState() => _LoginByMailFormWidgetState();
}

class _LoginByMailFormWidgetState extends State<LoginByMailFormWidget> {
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MailLoginBloc, MailLoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          context.go(RoutesK.loading);
        }
      },
      builder: (context, state) {
        final bloc = context.read<MailLoginBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              key: const Key("login_mail_field"),
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.mail.displayError,
                "Email",
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              onChanged: (value) => context
                  .read<MailLoginBloc>()
                  .add(MailLoginEvent.emailChange(value)),
            ),
            TextFormField(
              key: const Key("login_password_field"),
              focusNode: f2,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.password.displayError,
                "Hasło",
                errorMaxLine: 3,
              ),
              onChanged: (value) => context
                  .read<MailLoginBloc>()
                  .add(MailLoginEvent.passwordChange(value)),
              onEditingComplete: () {
                f2.unfocus();
                context
                    .read<MailLoginBloc>()
                    .add(const MailLoginEvent.submit());
              },
            ),
            Column(
              children: [
                FilledButton(
                  onPressed: () => context
                      .read<MailLoginBloc>()
                      .add(const MailLoginEvent.submit()),
                  child: const Text("Zaloguj"),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: const Text("Przypomnij hasło"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
