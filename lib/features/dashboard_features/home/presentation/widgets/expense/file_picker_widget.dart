import 'dart:io';

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/other_features/file/presentation/bloc/file_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h10,
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: Row(
              children: [
                Text(
                  S.of(context).file,
                  style: context.titleLarge!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<FileBloc, FileState>(
            builder: (context, state) {
              return state.when(
                initial: () => _buildInitial(context),
                loading: () => const CircularProgressIndicator(),
                data: (file) => _buildData(context, file),
                failure: (failure) => _buildInitial(context),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildInitial(BuildContext context) => Container(
        height: 50,
        width: double.infinity,
        padding: PaddingsK.all4,
        decoration: dropShadowEffect(context),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () =>
              context.read<FileBloc>().add(const FileEvent.pickImage()),
        ),
      );

  _buildData(BuildContext context, File file) => GestureDetector(
        onTap: () => context.read<FileBloc>().add(const FileEvent.pickImage()),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
                height: 150,
                padding: PaddingsK.all4,
                decoration: dropShadowEffect(context),
                child: ClipRRect(
                    borderRadius: PaddingsK.circular10,
                    child: Image.file(file))),
            Positioned(
              top: -5,
              right: -5,
              child: ClipOval(
                child: Material(
                  color: context.onPrimary,
                  child: InkWell(
                    onTap: () =>
                        context.read<FileBloc>().add(const FileEvent.clear()),
                    child: const SizedBox(
                        width: 30, height: 30, child: Icon(Icons.close)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
