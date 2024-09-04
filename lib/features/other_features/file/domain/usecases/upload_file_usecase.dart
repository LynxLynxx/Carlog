import 'dart:io';

import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/other_features/file/domain/repositories/file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UploadFileUsecase {
  final FilePickerRepository _filePickerRepository;

  UploadFileUsecase(this._filePickerRepository);

  Future<Either<Failure, String>> call(File file) async =>
      await _filePickerRepository.uploadFile(file);
}
