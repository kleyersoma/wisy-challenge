import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_challenge/model/photo_metadata.dart';
import 'package:wisy_challenge/services/abstract_cloud_firestore.dart';
import 'package:wisy_challenge/services/abstract_cloud_storage.dart';
import 'package:wisy_challenge/services/cloud_firestore.dart';
import 'package:wisy_challenge/services/cloud_storage.dart';

final cloudFirestoreProvider =
    Provider<AbstractCloudFirestore>((ref) => CloudFirestore());

final cloudStorageProvider =
    Provider<AbstractCloudStorage>((ref) => CloudStorage());

final uploadPhotoFileAndMetadataProvider =
    FutureProvider.family<void, String>((ref, filePath) async {
  final photoFile = File(filePath);
  if (photoFile.existsSync()) {
    log('Photo file exists.');
    final photoName = photoFile.path.split('/').last;

    // Upload picture to Cloud Storage
    final firestoreUrl = await ref
        .read(cloudStorageProvider)
        .uploadPhoto(photoFile: photoFile, photoFileName: photoName);

    // Upload metadata to Firestore
    final dateTimeNowMillisencondsSinceEpoch =
        Timestamp.fromMillisecondsSinceEpoch(
            int.parse(photoName.split('.').first));
    PhotoMetadata photoMetadata = PhotoMetadata(
        firestoreUrl: firestoreUrl,
        timestamp: dateTimeNowMillisencondsSinceEpoch,
        fileName: photoName);
    await ref
        .read(cloudFirestoreProvider)
        .addPhotoMetadata(photoMetadata: photoMetadata);
  } else {
    log('Photo file does not exists.');
  }
});
