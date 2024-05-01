import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginByMailFormWidget extends StatelessWidget {
  const LoginByMailFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          autocorrect: false,
          autofillHints: const [AutofillHints.email],
          decoration: authTextFormFieldInputDecoration(
            context,
            null,
            "Email",
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.go,
          // onFieldSubmitted: ()(),
          // FocusScope.of(context).requestFocus(focus),
          onChanged: (value) {},
        ),
        TextFormField(
          // focusNode: focus,
          obscureText: true,
          autofillHints: const [AutofillHints.password],
          decoration: authTextFormFieldInputDecoration(
            context,
            null,
            "Hasło",
          ),
          // onChanged: (value) => context
          //     .read<MailLoginBloc>()
          //     .add(MailLoginEvent.passwordChanged(value)),
          // onEditingComplete: () => context
          //     .read<MailLoginBloc>()
          //     .add(const MailLoginEvent.loginSubmitted()),
        ),
        Column(
          children: [
            FilledButton(
              onPressed: () => context.go(RoutesK.home),
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
  }
}
