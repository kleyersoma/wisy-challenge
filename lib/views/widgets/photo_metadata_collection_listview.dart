import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_challenge/providers/providers.dart';
import 'package:wisy_challenge/views/photo_view.dart';

class PhotoMetadataCollectionListView extends ConsumerWidget {
  const PhotoMetadataCollectionListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoMetadataCollectionList =
        ref.watch(cloudFirestoreProviderMetadataList);

    return photoMetadataCollectionList.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No Photo Metadata Found'),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final photoMetadata = data.elementAt(index);
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
        error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
