import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wisy_challenge/views/widgets/photo_metadata_collection_listview.dart';
import 'package:wisy_challenge/views/take_photo_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Metadata Collection'),
      ),
      body: const PhotoMetadataCollectionListView(),
      floatingActionButton: FloatingActionButton(

        onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TakePhotoView(),
        )),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
