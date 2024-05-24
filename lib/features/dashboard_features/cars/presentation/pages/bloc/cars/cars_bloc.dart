import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_event.dart';
part 'cars_state.dart';
part 'cars_bloc.freezed.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc() : super(_Initial()) {
    on<CarsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
