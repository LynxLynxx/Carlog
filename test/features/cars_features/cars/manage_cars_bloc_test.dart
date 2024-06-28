// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/brand_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/engine_capacity_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/engine_power_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/model_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/plate_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/year_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

import '../../../helpers/test_helpers.mocks.dart';

late MockCarRepository mockCarRepository;
late CarsBloc carsBloc;
late ManageCarBloc manageCarBloc;

void main() {
  setUp(() async {
    mockCarRepository = MockCarRepository();
    carsBloc = CarsBloc(mockCarRepository);
    manageCarBloc = ManageCarBloc(mockCarRepository, carsBloc);
    S.delegate.load(const Locale('en'));
  });

  group(
    "manage car bloc tests",
    () {
      test('initial status is initial', () {
        expect(
          manageCarBloc.state.status,
          FormzSubmissionStatus.initial,
        );
      });

      group('brand changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated brand when ManageCarEvent.brandChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.brandChanged('newBrand')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              brandEntity: const BrandEntityValidator.pure('newBrand'),
            ),
          ],
          verify: (_) {
            const brandEntity = BrandEntityValidator.pure('newBrand');
            expect(brandEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid brand when ManageCarEvent.brandChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.brandChanged('1')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              brandEntity: const BrandEntityValidator.pure('1'),
            ),
          ],
          verify: (_) {
            const brandEntity = BrandEntityValidator.pure('1');
            expect(brandEntity.error, S.current.carBrandValidator);
          },
        );
      });

      group('model changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated model when ManageCarEvent.modelChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.modelChanged('newModel')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              modelEntity: const ModelEntityValidator.pure('newModel'),
            ),
          ],
          verify: (_) {
            const modelEntity = ModelEntityValidator.pure('newModel');
            expect(modelEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid model when ManageCarEvent.modelChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.modelChanged('')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              modelEntity: const ModelEntityValidator.pure(''),
            ),
          ],
          verify: (_) {
            const modelEntity = ModelEntityValidator.pure('');
            expect(modelEntity.error, S.current.carModelValidator);
          },
        );
      });

      group('year changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated year when ManageCarEvent.yearChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.yearChanged('2022')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              yearEntity: const YearEntityValidator.pure('2022'),
            ),
          ],
          verify: (_) {
            const yearEntity = YearEntityValidator.pure('2022');
            expect(yearEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid year when ManageCarEvent.yearChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.yearChanged('202')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              yearEntity: const YearEntityValidator.pure('202'),
            ),
          ],
          verify: (_) {
            const yearEntity = YearEntityValidator.pure('202');
            expect(yearEntity.error, S.current.carYearValidator);
          },
        );
      });

      group('milage changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated milage when ManageCarEvent.milageChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.milageChanged('10000')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              milageEntity: const MilageEntityValidator.pure('10000'),
            ),
          ],
          verify: (_) {
            const milageEntity = MilageEntityValidator.pure('10000');
            expect(milageEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid milage when ManageCarEvent.milageChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.milageChanged('100000000')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              milageEntity: const MilageEntityValidator.pure('100000000'),
            ),
          ],
          verify: (_) {
            const milageEntity = MilageEntityValidator.pure('100000000');
            expect(milageEntity.error, S.current.milageValidator);
          },
        );
      });

      group('plate changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated plate when ManageCarEvent.plateChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.plateChanged('AUM 550')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              plateEntity: const PlateEntityValidator.pure('AUM 550'),
            ),
          ],
          verify: (_) {
            const plateEntity = PlateEntityValidator.pure('AUM 550');
            expect(plateEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid plate when ManageCarEvent.plateChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) => bloc.add(const ManageCarEvent.plateChanged(' ')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              plateEntity: const PlateEntityValidator.pure(' '),
            ),
          ],
          verify: (_) {
            const plateEntity = PlateEntityValidator.pure(' ');
            expect(plateEntity.error, S.current.carPlateValidator);
          },
        );
      });

      group('car type changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated car type when ManageCarEvent.carTypeChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.carTypeChanged(CarTypeEnum.Coupe)),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              typeEntity: CarTypeEnum.Coupe,
            ),
          ],
        );
      });

      group('fuel type changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated fuel type when ManageCarEvent.fuelTypeChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) => bloc
              .add(const ManageCarEvent.fuelTypeChanged(FuelTypeEnum.Electric)),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              fuelTypeEntity: FuelTypeEnum.Electric,
            ),
          ],
        );
      });

      group('engine capacity changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated engine capacity when ManageCarEvent.engineCapacityChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.engineCapacityChanged('1984')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              engineCapacityEntity:
                  const EngineCapacityEntityValidator.pure('1984'),
            ),
          ],
          verify: (_) {
            const engineCapacityEntity =
                EngineCapacityEntityValidator.pure('1984');
            expect(engineCapacityEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid engine capacity when ManageCarEvent.engineCapacityChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.engineCapacityChanged('10000000')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              engineCapacityEntity:
                  const EngineCapacityEntityValidator.pure('10000000'),
            ),
          ],
          verify: (_) {
            const engineCapacityEntity =
                EngineCapacityEntityValidator.pure('10000000');
            expect(
                engineCapacityEntity.error, S.current.engineCapacityValidator);
          },
        );
      });

      group('engine power changed', () {
        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with updated engine power when ManageCarEvent.enginePowerChanged event is added',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.enginePowerChanged('163')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              enginePowerEntity: const EnginePowerEntityValidator.pure('163'),
            ),
          ],
          verify: (_) {
            const enginePowerEntity = EnginePowerEntityValidator.pure('163');
            expect(enginePowerEntity.error, null);
          },
        );

        blocTest<ManageCarBloc, ManageCarState>(
          'should emit state with invalid engine power when ManageCarEvent.enginePowerChanged event is added with invalid value',
          build: () => manageCarBloc,
          act: (bloc) =>
              bloc.add(const ManageCarEvent.enginePowerChanged('10000')),
          expect: () => <ManageCarState>[
            manageCarBloc.state.copyWith(
              enginePowerEntity: const EnginePowerEntityValidator.pure('10000'),
            ),
          ],
          verify: (_) {
            const enginePowerEntity = EnginePowerEntityValidator.pure('10000');
            expect(enginePowerEntity.error, S.current.enginePowerValidator);
          },
        );
      });

      group(
        'brand submit',
        () {
          blocTest<ManageCarBloc, ManageCarState>(
            'emits state with status success and then inProgress when brand is valid',
            build: () => manageCarBloc,
            act: (bloc) => bloc.add(const ManageCarEvent.submitCarBrand()),
            seed: () => manageCarBloc.state.copyWith(
              brandEntity: const BrandEntityValidator.pure('Audi'),
            ),
            wait: const Duration(milliseconds: 400),
            expect: () => <ManageCarState>[
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.success,
                isButtonActive: false,
              ),
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.inProgress,
                isButtonActive: true,
              ),
            ],
            verify: (bloc) {
              final state = bloc.state;
              expect(state.brandEntity.error, null);
              expect(state.status, FormzSubmissionStatus.inProgress);
            },
          );
        },
      );

      group(
        'model submit',
        () {
          blocTest<ManageCarBloc, ManageCarState>(
            'emits state with status success and then inProgress when model is valid',
            build: () => manageCarBloc,
            act: (bloc) => bloc.add(const ManageCarEvent.submitCarModel()),
            seed: () => manageCarBloc.state.copyWith(
              modelEntity: const ModelEntityValidator.pure('A4'),
            ),
            wait: const Duration(milliseconds: 400),
            expect: () => <ManageCarState>[
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.success,
                isButtonActive: false,
              ),
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.inProgress,
                isButtonActive: true,
              ),
            ],
            verify: (bloc) {
              final state = bloc.state;
              expect(state.modelEntity.error, null);
              expect(state.status, FormzSubmissionStatus.inProgress);
            },
          );
        },
      );

      group(
        'main info submit',
        () {
          blocTest<ManageCarBloc, ManageCarState>(
            'emits state with status success and then inProgress when main info is valid',
            build: () => manageCarBloc,
            act: (bloc) => bloc.add(const ManageCarEvent.submitCarMainInfo()),
            seed: () => manageCarBloc.state.copyWith(
              yearEntity: const YearEntityValidator.pure('2024'),
              milageEntity: const MilageEntityValidator.pure('10000'),
              plateEntity: const PlateEntityValidator.pure('AUM 550'),
            ),
            wait: const Duration(milliseconds: 1200),
            expect: () => <ManageCarState>[
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.success,
                isButtonActive: false,
              ),
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.inProgress,
                isButtonActive: true,
              ),
            ],
            verify: (bloc) {
              final state = bloc.state;
              expect(state.yearEntity.error, null);
              expect(state.milageEntity.error, null);
              expect(state.plateEntity.error, null);
              expect(state.status, FormzSubmissionStatus.inProgress);
            },
          );
        },
      );

      group(
        'sub main info submit',
        () {
          blocTest<ManageCarBloc, ManageCarState>(
            'emits state with status success and then inProgress when sub main info is valid',
            build: () => manageCarBloc,
            act: (bloc) =>
                bloc.add(const ManageCarEvent.submitCarSubMainInfo()),
            seed: () => manageCarBloc.state.copyWith(
              typeEntity: CarTypeEnum.Coupe,
              fuelTypeEntity: FuelTypeEnum.Electric,
              engineCapacityEntity:
                  const EngineCapacityEntityValidator.pure('1984'),
              enginePowerEntity: const EnginePowerEntityValidator.pure('163'),
            ),
            wait: const Duration(milliseconds: 1200),
            expect: () => <ManageCarState>[
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.success,
                isButtonActive: false,
              ),
              manageCarBloc.state.copyWith(
                status: FormzSubmissionStatus.inProgress,
                isButtonActive: true,
              ),
            ],
            verify: (bloc) {
              final state = bloc.state;
              expect(state.engineCapacityEntity.error, null);
              expect(state.enginePowerEntity.error, null);
              expect(state.status, FormzSubmissionStatus.inProgress);
            },
          );
        },
      );

      group(
        'set initial car',
        () {
          blocTest<ManageCarBloc, ManageCarState>(
            'emits state with car details from CarFirebaseEntity',
            build: () => manageCarBloc,
            act: (bloc) => bloc.add(ManageCarEvent.setInitialCar(
              CarFirebaseEntity.example(),
            )),
            expect: () => <ManageCarState>[
              manageCarBloc.state.copyWith(
                brandEntity: const BrandEntityValidator.dirty(value: 'Audi'),
                modelEntity: const ModelEntityValidator.dirty(value: 'A4'),
                yearEntity: const YearEntityValidator.dirty(value: '2010'),
                milageEntity:
                    const MilageEntityValidator.dirty(value: '200000'),
                plateEntity:
                    const PlateEntityValidator.dirty(value: 'WAW 12345'),
                typeEntity: CarTypeEnumExtension.fromString('Sedan'),
                fuelTypeEntity: FuelTypeEnumExtension.fromString('Diesel'),
                engineCapacityEntity:
                    const EngineCapacityEntityValidator.dirty(value: '2000'),
                enginePowerEntity:
                    const EnginePowerEntityValidator.dirty(value: '140'),
              ),
            ],
          );
        },
      );
    },
  );
}
