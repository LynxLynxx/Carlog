part of 'basic_add_car_bloc.dart';

@freezed
class BasicAddCarEvent with _$BasicAddCarEvent {
  const factory BasicAddCarEvent.changeBrand({required int brandId}) =
      _ChangeBrand;
  const factory BasicAddCarEvent.changeModel({required int modelId}) =
      _ChangeModel;
}
