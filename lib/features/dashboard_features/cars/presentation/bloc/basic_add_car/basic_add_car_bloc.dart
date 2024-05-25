import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_add_car_bloc.freezed.dart';
part 'basic_add_car_event.dart';
part 'basic_add_car_state.dart';

class BasicAddCarBloc extends Bloc<BasicAddCarEvent, BasicAddCarState> {
  BasicAddCarBloc() : super(const _BasicAddCarState()) {
    on<_ChangeBrand>(_onChangeBrand);
    on<_ChangeModel>(_onChangeModel);
  }

  _onChangeBrand(_ChangeBrand event, Emitter<BasicAddCarState> emit) {
    emit(state.copyWith(brandId: event.brandId, modelId: 0));
  }

  _onChangeModel(_ChangeModel event, Emitter<BasicAddCarState> emit) {
    emit(state.copyWith(modelId: event.modelId));
  }
}
