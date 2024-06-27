// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_test/bloc_test.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

late CarsBloc carsBloc;
late MockCarRepository mockCarRepository;

void main() {
  late CarRepository mockCarRepository;

  final exampleCar = CarFirebaseEntity.example();

  setUp(() async {
    mockCarRepository = MockCarRepository();
    carsBloc = CarsBloc(mockCarRepository);
  });

  test('initial status is initial', () {
    expect(
      carsBloc.state.status,
      FormzSubmissionStatus.initial,
    );
  });

  blocTest<CarsBloc, CarsState>(
    "should emit [.inProgress, .success] when getting cars",
    build: () {
      when(mockCarRepository.getListOfCarsByUser()).thenAnswer(
        (_) async => Right([exampleCar, exampleCar]),
      );
      return carsBloc;
    },
    act: (bloc) => bloc.add(const CarsEvent.getCars()),
    expect: () => [
      const CarsState(
        FormzSubmissionStatus.inProgress,
        [],
      ),
      CarsState(
        FormzSubmissionStatus.success,
        [exampleCar, exampleCar],
      ),
    ],
  );

  blocTest<CarsBloc, CarsState>(
    "should emit [.inProgress, .failure] when getting cars fails",
    build: () {
      when(mockCarRepository.getListOfCarsByUser()).thenAnswer(
        (_) async => const Left(FirestoreFailure(message: "Firestore failure")),
      );
      return carsBloc;
    },
    act: (bloc) => bloc.add(const CarsEvent.getCars()),
    expect: () => [
      const CarsState(
        FormzSubmissionStatus.inProgress,
        [],
      ),
      const CarsState(
        FormzSubmissionStatus.failure,
        [],
        "Firestore failure",
      ),
    ],
  );

  // group("User changed", () {
  //   blocTest<AuthBloc, AuthState>(
  //     'emits authenticated when user is not empty',
  //     setUp: () {
  //       when(() => user.isAuth).thenReturn(true);
  //       when(() => mockAuthRepository.user).thenAnswer(
  //         (_) => Stream.value(user),
  //       );
  //     },
  //     build: () => AuthBloc(
  //       mockAuthRepository,
  //     ),
  //     seed: AuthState.unauthenticated,
  //     expect: () => [
  //       const AuthState.loading(),
  //       const AuthState.unauthenticated(),
  //       AuthState.authenticated(user),
  //     ],
  //   );

  //   blocTest<AuthBloc, AuthState>(
  //     'emits unauthenticated when user is empty',
  //     setUp: () {
  //       when(() => mockAuthRepository.user).thenAnswer(
  //         (_) => Stream.value(UserEntity.unAuth),
  //       );
  //     },
  //     build: () => AuthBloc(
  //       mockAuthRepository,
  //     ),
  //     expect: () => [
  //       const AuthState.loading(),
  //       const AuthState.unauthenticated(),
  //     ],
  //   );
  // });

  // group("Logout", () {
  //   blocTest<AuthBloc, AuthState>(
  //     'invokes logOut',
  //     setUp: () {
  //       when(
  //         () => mockAuthRepository.logOut(),
  //       ).thenAnswer((_) async {
  //         return null;
  //       });
  //     },
  //     build: () => AuthBloc(
  //       mockAuthRepository,
  //     ),
  //     act: (bloc) => bloc.add(const AuthEvent.appLogoutRequested()),
  //     verify: (_) {
  //       verify(() => mockAuthRepository.logOut()).called(1);
  //     },
  //   );
  // });
}
