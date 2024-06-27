// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_test/bloc_test.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

late CarsBloc carsBloc;
late MockCarRepository mockCarRepository;

void main() {
  final exampleCar = CarFirebaseEntity.example();

  setUp(() async {
    mockCarRepository = MockCarRepository();
    carsBloc = CarsBloc(mockCarRepository);
  });

  group("cars bloc tests", () {
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
          (_) async =>
              const Left(FirestoreFailure(message: "Firestore failure")),
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
  });
}
