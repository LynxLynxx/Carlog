import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/auth_features/login/presentation/bloc/mail_login_bloc.dart';
import 'package:carlog/generated/l10n.dart';
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

  bool isPasswordObscure = true;

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
                S.of(context).email,
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
              obscureText: isPasswordObscure,
              autofillHints: const [AutofillHints.password],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.password.displayError ?? bloc.state.errorMessage,
                S.of(context).password,
                errorMaxLine: 3,
                changeObscure: IconButton(
                  onPressed: () => setState(
                    () {
                      isPasswordObscure = !isPasswordObscure;
                    },
                  ),
                  icon: Icon(
                    isPasswordObscure ? Icons.lock : Icons.lock_open,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
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
                  child: Text(S.of(context).login),
                ),
                TextButton(
                  onPressed: () => context.push(RoutesK.recoveryPassword),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Text(S.of(context).remindPassword),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
