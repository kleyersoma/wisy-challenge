import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wisy_challenge/services/abstract_cloud_firestore.dart';
import 'package:wisy_challenge/core/collections.dart';
import 'package:wisy_challenge/model/photo_metadata.dart';

class CloudFirestore implements AbstractCloudFirestore {
  CollectionReference photoCollection =
      FirebaseFirestore.instance.collection(photoMetadataCollection);

  @override
  Future<void> addPhotoMetadata({required PhotoMetadata photoMetadata}) async =>
      await photoCollection.add(photoMetadata.toJson());

  @override
  Stream<QuerySnapshot<Object?>> getPhotoMetadataCollection() async* {
    yield* photoCollection.snapshots();
  }
}
