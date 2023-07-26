import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:wisy_challenge/services/abstract_cloud_storage.dart';
import 'package:wisy_challenge/core/collections.dart';

class CloudStorage implements AbstractCloudStorage {
  final storageRef = FirebaseStorage.instance.ref();

  

  @override
  Future<String> uploadPhoto(
      {required File photoFile, required String photoFileName}) async {
    Reference photoAlbumDirReference = storageRef.child(photoAlbumReference);
    Reference photoToUpload = photoAlbumDirReference.child(photoFileName);
    try {
      await photoToUpload.putFile(photoFile);
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return await photoToUpload.getDownloadURL();
  }
}
