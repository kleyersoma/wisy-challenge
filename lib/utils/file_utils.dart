import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


Future<String> path() async {
  final Directory extDir = await getTemporaryDirectory();
  final temporaryDir = await Directory('${extDir.path}/wisy-challenge-gallery')
      .create(recursive: true);

  const String fileExtension = 'jpg';
  final dateTimeNowMillisencondsSinceEpoch =
      DateTime.now().millisecondsSinceEpoch;
  final photoName = '$dateTimeNowMillisencondsSinceEpoch.$fileExtension';
  final String photoFileTemporaryPath = '${temporaryDir.path}/$photoName';
  log('Photo temporary path: $photoFileTemporaryPath');

  return photoFileTemporaryPath;
}
