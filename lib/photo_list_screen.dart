import 'dart:convert';
import 'package:assignment_3/photo_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<dynamic> photos = [];
  bool isLoading = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        setState(() {
          photos = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      setState(() {
        error = 'Failed to fetch data: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallary App'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
          ? Center(child: Text(error))
          : ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return ListTile(
            title: Text(photo['title']),
            leading: Image.network(
              photo['thumbnailUrl'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailScreen(
                    photoId: photo['id'],
                    title: photo['title'],
                    fullUrl: photo['url'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}