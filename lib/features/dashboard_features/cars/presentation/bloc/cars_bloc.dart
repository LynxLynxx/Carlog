import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc() : super(CarsInitial()) {
    on<CarsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
