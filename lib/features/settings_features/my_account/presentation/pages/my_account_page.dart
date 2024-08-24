import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/settings_features/my_account/presentation/cubit/user_data_cubit.dart';
import 'package:carlog/features/settings_features/my_account/presentation/widgets/user_data_form.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:carlog/shared/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(locator(), locator())..getUserData(),
      child: const _MyAccountView(),
    );
  }
}

class _MyAccountView extends StatefulWidget {
  const _MyAccountView();

  @override
  State<_MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<_MyAccountView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FocusNode firstNameScope = FocusNode();
  final FocusNode lastNameScope = FocusNode();

  final userDataFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: CarlogScaffold.title(
        title: S.of(context).myAccount,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: BlocConsumer<UserDataCubit, UserDataState>(
            listener: (context, state) => state.whenOrNull(
              data: (userData) {
                firstNameController.value =
                    TextEditingValue(text: userData.firstName);
                lastNameController.value =
                    TextEditingValue(text: userData.lastName);
                emailController.value = TextEditingValue(text: userData.email);
                return null;
              },
            ),
            builder: (context, state) {
              return state.when(
                loading: () => UserDataForm(
                  userDataFormKey: userDataFormKey,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                ),
                initial: () => Skeletonizer(
                  enabled: true,
                  child: UserDataForm(
                    userDataFormKey: userDataFormKey,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                  ),
                ),
                data: (data) => UserDataForm(
                  userDataFormKey: userDataFormKey,
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                  onEditingComplete: (_) => _onSave(),
                ),
                failure: (failure) => ErrorIndicator(failure: failure),
              );
            },
          ),
        ),
        bottomWidget: BlocSelector<UserDataCubit, UserDataState, bool>(
          selector: (state) {
            return state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            );
          },
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: lastNameController,
              builder: (context, value, child) => ValueListenableBuilder(
                valueListenable: firstNameController,
                builder: (context, value, child) => CarlogBottomButtonWidget(
                  title: S.of(context).save,
                  isLoading: state,
                  isActive: context.watch<UserDataCubit>().isActive(
                      firstNameController.text, lastNameController.text),
                  onTap: _onSave(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _onSave() {
    bool valid = userDataFormKey.currentState!.validate();
    if (!valid) {
      return;
    }
    context
        .read<UserDataCubit>()
        .updateUserData(firstNameController.text, lastNameController.text);
  }
}
