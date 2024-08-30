import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'about_app_state.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit() : super(AboutAppInitial());
}
