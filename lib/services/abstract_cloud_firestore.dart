import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wisy_challenge/model/photo_metadata.dart';

abstract class AbstractCloudFirestore {
  Future<void> addPhotoMetadata({required PhotoMetadata photoMetadata});
  Stream<QuerySnapshot<Object?>> getPhotoMetadataCollection();
}
