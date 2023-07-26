import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wisy_challenge/model/photo_metadata.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key, required this.photoMetadata});
  final PhotoMetadata photoMetadata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Metadata'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: photoMetadata.firestoreUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text('File Name: ${photoMetadata.fileName}')),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Timestamp: ${photoMetadata.timestamp.toString()}'),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Firestore Url: ${photoMetadata.firestoreUrl}'),
            ),
          ],
        ),
      ),
    );
  }
}
