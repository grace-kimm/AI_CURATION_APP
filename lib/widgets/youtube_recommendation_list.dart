import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser; // 추가된 부분

class YoutubeRecommendationList extends StatefulWidget {
  const YoutubeRecommendationList({super.key});

  @override
  YoutubeRecommendationListState createState() => YoutubeRecommendationListState();
}

class YoutubeRecommendationListState extends State<YoutubeRecommendationList> {
  final String videoId = 'c5Q1WDGTjwk';
  Map<String, dynamic>? videoData;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchVideoData();
  }

  Future<void> fetchVideoData() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.youtube.com/watch?v=$videoId'),
      );

      if (response.statusCode == 200) {
        final document = html_parser.parse(response.body); // 수정된 부분
        final jsonData = document.querySelector('script[type="application/ld+json"]')?.text;
        if (jsonData != null) {
          final data = json.decode(jsonData);
          setState(() {
            videoData = data;
            isLoading = false;
          });
        } else {
          setState(() {
            hasError = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
        print('Failed to load video data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (hasError) {
      return const Center(child: Icon(Icons.error));
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              videoData!['thumbnailUrl'],
              width: 120,
              height: 90,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoData!['name'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${videoData!['author']['name']}'),
                  Text('Published on ${videoData!['uploadDate']}'),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
