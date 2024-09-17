import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/auth_features/register/presentation/bloc/mail_register/mail_register_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class RegisterByMailFormWidget extends StatefulWidget {
  const RegisterByMailFormWidget({
    super.key,
  });

  @override
  State<RegisterByMailFormWidget> createState() =>
      _RegisterByMailFormWidgetState();
}

class _RegisterByMailFormWidgetState extends State<RegisterByMailFormWidget> {
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();

  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MailRegisterBloc, MailRegisterState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          context.go(RoutesK.loading);
        }
      },
      builder: (context, state) {
        final bloc = context.read<MailRegisterBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              key: const Key("register_name_field"),
              autocorrect: false,
              autofillHints: const [AutofillHints.name],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.mail.displayError,
                S.of(context).name,
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.go,
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              onChanged: (value) => context
                  .read<MailRegisterBloc>()
                  .add(MailRegisterEvent.nameChange(value)),
            ),
            TextFormField(
              key: const Key("register_mail_field"),
              autocorrect: false,
              autofillHints: const [AutofillHints.email],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.mail.displayError,
                S.of(context).email,
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              focusNode: f2,
              onEditingComplete: () {
                f2.unfocus();
                FocusScope.of(context).requestFocus(f3);
              },
              onChanged: (value) => context
                  .read<MailRegisterBloc>()
                  .add(MailRegisterEvent.emailChange(value)),
            ),
            TextFormField(
              key: const Key("register_password_field"),
              focusNode: f3,
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
                    color: context.onSurface,
                  ),
                ),
              ),
              onChanged: (value) => context
                  .read<MailRegisterBloc>()
                  .add(MailRegisterEvent.passwordChange(value)),
              onEditingComplete: () {
                f3.unfocus();
                context
                    .read<MailRegisterBloc>()
                    .add(const MailRegisterEvent.submit());
              },
            ),
            Column(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 122),
                  child: FilledButton(
                    onPressed: () => context
                        .read<MailRegisterBloc>()
                        .add(const MailRegisterEvent.submit()),
                    child: bloc.state.status.isInProgress
                        ? Transform.scale(
                            scale: 0.5,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 6,
                            ),
                          )
                        : Text(S.of(context).register),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
