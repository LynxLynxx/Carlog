import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/auth_features/register/presentation/bloc/mail_register/mail_register_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MailRegisterBloc, MailRegisterState>(
      builder: (context, state) {
        final bloc = context.read<MailRegisterBloc>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
              },
              onChanged: (value) => context
                  .read<MailRegisterBloc>()
                  .add(MailRegisterEvent.emailChange(value)),
            ),
            TextFormField(
              key: const Key("register_password_field"),
              focusNode: f2,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: authTextFormFieldInputDecoration(
                context,
                bloc.state.password.displayError,
                S.of(context).password,
                errorMaxLine: 3,
              ),
              onChanged: (value) => context
                  .read<MailRegisterBloc>()
                  .add(MailRegisterEvent.passwordChange(value)),
              onEditingComplete: () {
                f2.unfocus();
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
                AnimatedSwitcher(
                  duration: Durations.long2,
                  child: bloc.state.errorMessage == null
                      ? const SizedBox(height: 10)
                      : Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              bloc.state.errorMessage!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onError,
                              ),
                            ),
                          ),
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
