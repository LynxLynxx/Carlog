part of 'add_car_bloc.dart';

@freezed
class AddCarEvent with _$AddCarEvent {
  const factory AddCarEvent.changeBrand({required int brandId}) =
      _ChangeBrand;
  const factory AddCarEvent.changeModel({required int modelId}) =
      _ChangeModel;
}
