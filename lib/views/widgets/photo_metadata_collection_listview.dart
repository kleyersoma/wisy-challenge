
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_challenge/model/photo_metadata.dart';
import 'package:wisy_challenge/providers/providers.dart';
import 'package:wisy_challenge/views/photo_view.dart';

class PhotoMetadataCollectionListView extends ConsumerWidget {
  const PhotoMetadataCollectionListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<QuerySnapshot>(
      stream: ref.watch(cloudFirestoreProvider).getPhotoMetadataCollection(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final photoMetadataCollectionList = snapshot.data!.docs.map((document) {
          Map<String, dynamic> photoMetadataDocument =
              document.data()! as Map<String, dynamic>;
          PhotoMetadata photoMetadata =
              PhotoMetadata.fromJson(photoMetadataDocument);
          return photoMetadata;
        }).toList();

        if (photoMetadataCollectionList.isEmpty) {
          return const Center(
            child: Text('No files found at server'),
          );
        }
        return ListView.builder(
          itemCount: photoMetadataCollectionList.length,
          itemBuilder: (context, index) {
            final photoMetadata = photoMetadataCollectionList.elementAt(index);
            return ListTile(
              leading: Text((index + 1).toString()),
              title: Text(photoMetadata.fileName),
              subtitle: Text(photoMetadata.timestamp.toString()),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PhotoView(photoMetadata: photoMetadata),
                  )),
            );
          },
        );
      },
    );
  }
}
