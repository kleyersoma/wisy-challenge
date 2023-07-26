import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_challenge/providers/providers.dart';
import 'package:wisy_challenge/utils/file_utils.dart';

class TakePhotoView extends ConsumerWidget {
  const TakePhotoView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(pathBuilder: () async => await path()),
        onMediaTap: (mediaCapture) async => ref.read<void>(
            uploadPhotoFileAndMetadataProvider(mediaCapture.filePath)),
      ),
    );
  }
}
