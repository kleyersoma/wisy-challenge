import 'dart:io';

abstract class AbstractCloudStorage {
  Future<String> uploadPhoto(
      {required File photoFile, required String photoFileName});
}
