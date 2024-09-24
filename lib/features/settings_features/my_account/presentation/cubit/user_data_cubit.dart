import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/update_user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/usecases/get_user_data_usecase.dart';
import 'package:carlog/features/settings_features/my_account/domain/usecases/update_user_data_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_cubit.freezed.dart';
part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final UpdateUserDataUsecase _updateUserDataUsecase;
  final AuthBloc _authBloc;
  UserDataEntity? userData;

  UserDataCubit(
      this._getUserDataUsecase, this._updateUserDataUsecase, this._authBloc)
      : super(const UserDataState.initial());

  void getUserData() async {
    final result = await _getUserDataUsecase.call();

    result.fold(
      (l) => emit(_Failure(l)),
      (r) async {
        userData = r;
        if (r.firstName == "" && r.lastName == "") {
          final userDisplayName =
              FirebaseAuth.instance.currentUser?.displayName;
          if (userDisplayName != null) {
            userData = userData!.copyWith(
              firstName: userDisplayName.split(" ").first,
              lastName: userDisplayName.split(" ").last,
            );
          }
        }
        emit(_Data(userData!));
      },
    );
  }

  bool isActive(String firstName, String lastName) {
    if (firstName == userData?.firstName && lastName == userData?.lastName) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> updateUserData(String firstName, String lastName) async {
    final UpdateUserDataEntity updateUserData =
        UpdateUserDataEntity(firstName: firstName, lastName: lastName);

    emit(const _Loading());
    final result = await _updateUserDataUsecase.call(updateUserData);

    result.fold(
      () {
        userData = UserDataEntity(firstName, lastName, userData!.email);
        _authBloc.add(AuthEvent.changedUserData(userData!));
        emit(_Data(userData!));
      },
      (l) => emit(_Failure(l)),
    );
  }
}
