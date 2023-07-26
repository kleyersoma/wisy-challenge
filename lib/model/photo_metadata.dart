import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoMetadata {
  final String firestoreUrl;
  final Timestamp timestamp;
  final String fileName;
  PhotoMetadata(
      {required this.firestoreUrl,
      required this.timestamp,
      required this.fileName});

  PhotoMetadata.fromJson(Map<String, Object?> json)
      : this(
            firestoreUrl: json['firestoreUrl'] as String,
            timestamp: json['timestamp'] as Timestamp,
            fileName: json['fileName'] as String);

  Map<String, Object?> toJson() {
    return {
      'firestoreUrl': firestoreUrl,
      'timestamp': timestamp,
      'fileName': fileName
    };
  }
}
