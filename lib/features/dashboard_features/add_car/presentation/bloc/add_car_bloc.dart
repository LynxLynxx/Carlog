import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_bloc.freezed.dart';
part 'add_car_event.dart';
part 'add_car_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  AddCarBloc() : super(const _AddCarState()) {
    on<_ChangeBrand>(_onChangeBrand);
    on<_ChangeModel>(_onChangeModel);
  }

  _onChangeBrand(_ChangeBrand event, Emitter<AddCarState> emit) {
    emit(state.copyWith(brandId: event.brandId, modelId: 0));
  }

  _onChangeModel(_ChangeModel event, Emitter<AddCarState> emit) {
    emit(state.copyWith(modelId: event.modelId));
  }
}
