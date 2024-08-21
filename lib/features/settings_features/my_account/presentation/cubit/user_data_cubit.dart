import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/update_user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/usecases/get_user_data_usecase.dart';
import 'package:carlog/features/settings_features/my_account/domain/usecases/update_user_data_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_cubit.freezed.dart';
part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final GetUserDataUsecase _getUserDataUsecase;
  final UpdateUserDataUsecase _updateUserDataUsecase;
  UserDataEntity? userData;

  UserDataCubit(this._getUserDataUsecase, this._updateUserDataUsecase)
      : super(const UserDataState.initial());

  void getUserData() async {
    final result = await _getUserDataUsecase.call();

    result.fold(
      (l) => emit(_Failure(l)),
      (r) {
        userData = r;
        emit(_Data(r));
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
        emit(_Data(userData!));
      },
      (l) => emit(_Failure(l)),
    );
  }
}
