import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'webview_state.dart';

class WebviewCubit extends Cubit<WebviewState> {
  WebviewCubit() : super(WebviewInitial());
}
