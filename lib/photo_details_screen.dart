import 'package:flutter/material.dart';
class PhotoDetailScreen extends StatelessWidget {
  final int photoId;
  final String title;
  final String fullUrl;

  const PhotoDetailScreen({
    required this.photoId,
    required this.title,
    required this.fullUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(fullUrl),
            const SizedBox(height: 20),
            Text(
              'Title: $title',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'ID: $photoId',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}