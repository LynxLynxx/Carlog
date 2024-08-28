import 'dart:io';

import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';

abstract class FilePickerRepository {
  Future<Either<Failure, File>> pickFile();
}

@LazySingleton(as: FilePickerRepository)
class FilePickerRepositoryImpl implements FilePickerRepository {
  @override
  Future<Either<Failure, File>> pickFile() async {
    return handleResponse(() async {
      try {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) {
          throw Exception("No file picked");
        }

        XFile? photoCompressedFile =
            await compressImage(File(result.files.single.path!));

        return File(photoCompressedFile!.path);
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }

  Future<XFile?> compressImage(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.png|.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    if (lastIndex == filePath.lastIndexOf(RegExp(r'.png'))) {
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
          filePath, outPath,
          minWidth: 1000,
          minHeight: 1000,
          quality: 50,
          format: CompressFormat.png);
      return compressedImage;
    } else {
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        minWidth: 1000,
        minHeight: 1000,
        quality: 50,
      );
      return compressedImage;
    }
  }
}
