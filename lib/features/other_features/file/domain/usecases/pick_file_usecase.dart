import 'dart:io';

import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/other_features/file/domain/repositories/file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PickFileUsecase {
  final FilePickerRepository _filePickerRepository;

  PickFileUsecase(this._filePickerRepository);

  Future<Either<Failure, File>> call() async =>
      await _filePickerRepository.pickFile();
}
