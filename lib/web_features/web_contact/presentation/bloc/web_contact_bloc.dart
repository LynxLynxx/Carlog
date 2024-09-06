import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'web_contact_event.dart';
part 'web_contact_state.dart';

class WebContactBloc extends Bloc<WebContactEvent, WebContactState> {
  WebContactBloc() : super(WebContactInitial()) {
    on<WebContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
