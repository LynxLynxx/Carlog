import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carlog/features/auth_features/shared/entities/user_entity.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<UserEntity> _userSubscription;
  AuthBloc(this._authRepository) : super(const _Initial()) {
    on<_GetUserSession>(_onGetUserSession);
    on<_AppUserChanged>(_onAppUserChanged);
    on<_AppLogoutRequested>(_onAppLogoutRequested);
    on<_ChangedUserData>(_onChangedUserData);
    add(const _GetUserSession());

    _userSubscription = _authRepository.user.listen((user) {
      add(_AppUserChanged(user));
    });
  }

  _onGetUserSession(_GetUserSession event, Emitter<AuthState> emit) async {
    emit(const _Loading());
    final user = await _authRepository.currentUser;
    log("User: ${user.toString()}");
    if (user.isUnAuth) {
      return emit(const _Unauthenticated());
    } else {
      return emit(_Authenticated(user));
    }
  }

  _onAppUserChanged(_AppUserChanged event, Emitter<AuthState> emit) {
    emit(event.user.isAuth
        ? _Authenticated(event.user)
        : const _Unauthenticated());
  }

  _onAppLogoutRequested(
      _AppLogoutRequested event, Emitter<AuthState> emit) async {
    emit(const _Loading());
    await _authRepository.logOut();
    emit(const _Unauthenticated());
  }

  _onChangedUserData(_ChangedUserData event, Emitter<AuthState> emit) async {
    final user = await _authRepository.currentUser;
    final userData = user.copyWith(
        firstName: event.userData.firstName, lastName: event.userData.lastName);
    await _authRepository.updateUserData(userData);

    emit(_Authenticated(userData));
  }

  String? get userFirstName {
    String? userName = state.whenOrNull(
      authenticated: (user) {
        if (user.firstName == "" && user.name != null) {
          return user.name!.split(" ").first;
        }
        return user.firstName;
      },
    );

    if (userName == "") {
      return null;
    } else {
      return userName;
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
