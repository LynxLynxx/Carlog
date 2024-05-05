import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/features/auth_features/shared/entities/user_entity.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
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
    add(const _GetUserSession());

    _userSubscription = _authRepository.user.listen((user) {
      add(_AppUserChanged(user));
    });
  }

  _onGetUserSession(_GetUserSession event, Emitter<AuthState> emit) async {
    emit(const _Loading());
    final user = await _authRepository.currentUser;
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
    await _authRepository.logOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
