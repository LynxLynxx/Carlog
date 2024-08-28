import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/other_features/file/domain/usecases/pick_file_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_bloc.freezed.dart';
part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final PickFileUsecase _pickFileUsecase;
  FileBloc(this._pickFileUsecase) : super(const _Initial()) {
    on<_PickImage>(_onPickImage);
    on<_Clear>(_onClear);
  }

  _onPickImage(_PickImage event, Emitter<FileState> emit) async {
    emit(const _Loading());
    final result = await _pickFileUsecase.call();
    result.fold((l) => emit(_Failure(l)), (r) => emit(_Data(r)));
  }

  _onClear(_Clear event, Emitter<FileState> emit) {
    emit(const _Initial());
  }
}
