import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'microsoft_auth_cubit.freezed.dart';
part 'microsoft_auth_state.dart';

class MicrosoftAuthCubit extends Cubit<MicrosoftAuthState> {
  final AuthRepository _authRepository;
  MicrosoftAuthCubit(this._authRepository)
      : super(const MicrosoftAuthState.initial());

  void loginWithMicrosoft() async {
    emit(const MicrosoftAuthState.loading());
    final result = await _authRepository.signInWithMicrosoft();
    if (result.isSome()) {
      return emit(MicrosoftAuthState.error(result.asOption()));
    }
    final createUserDoc = await _authRepository.createUserDocument();
    if (createUserDoc.isSome()) {
      return emit(MicrosoftAuthState.error(createUserDoc.asOption()));
    }
  }
}
