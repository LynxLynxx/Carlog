import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'web_home_event.dart';
part 'web_home_state.dart';

class WebHomeBloc extends Bloc<WebHomeEvent, WebHomeState> {
  WebHomeBloc() : super(WebHomeInitial()) {
    on<WebHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
