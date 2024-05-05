import 'package:bloc_test/bloc_test.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/auth_features/shared/entities/user_entity.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// import '../../../helpers/test_helpers.mocks.dart';

class MockUser extends Mock implements UserEntity {}

class MockAuthenticationRepository extends Mock implements AuthRepository {}

void main() {
  late AuthRepository mockAuthRepository;
  late UserEntity user;

  setUp(() async {
    // mockFirebaseAuth = MockFirebaseAuth();
    user = MockUser();
    mockAuthRepository = MockAuthenticationRepository();
    when(() => mockAuthRepository.user)
        .thenAnswer((_) => const Stream<UserEntity>.empty());
    when(
      () => mockAuthRepository.currentUser,
    ).thenAnswer((_) async => UserEntity.unAuth);
  });

  test('initial state is initial', () {
    expect(
      AuthBloc(mockAuthRepository).state,
      const AuthState.initial(),
    );
  });

  group("User changed", () {
    blocTest<AuthBloc, AuthState>(
      'emits authenticated when user is not empty',
      setUp: () {
        when(() => user.isAuth).thenReturn(true);
        when(() => mockAuthRepository.user).thenAnswer(
          (_) => Stream.value(user),
        );
      },
      build: () => AuthBloc(
        mockAuthRepository,
      ),
      seed: AuthState.unauthenticated,
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
        AuthState.authenticated(user),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits unauthenticated when user is empty',
      setUp: () {
        when(() => mockAuthRepository.user).thenAnswer(
          (_) => Stream.value(UserEntity.unAuth),
        );
      },
      build: () => AuthBloc(
        mockAuthRepository,
      ),
      expect: () => [
        const AuthState.loading(),
        const AuthState.unauthenticated(),
      ],
    );
  });

  group("Logout", () {
    blocTest<AuthBloc, AuthState>(
      'invokes logOut',
      setUp: () {
        when(
          () => mockAuthRepository.logOut(),
        ).thenAnswer((_) async {});
      },
      build: () => AuthBloc(
        mockAuthRepository,
      ),
      act: (bloc) => bloc.add(const AuthEvent.appLogoutRequested()),
      verify: (_) {
        verify(() => mockAuthRepository.logOut()).called(1);
      },
    );
  });
}
