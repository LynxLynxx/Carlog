import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'web_request_feature_event.dart';
part 'web_request_feature_state.dart';

class WebRequestFeatureBloc extends Bloc<WebRequestFeatureEvent, WebRequestFeatureState> {
  WebRequestFeatureBloc() : super(WebRequestFeatureInitial()) {
    on<WebRequestFeatureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
