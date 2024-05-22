import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YoutubeRecommendationList extends StatefulWidget {
  const YoutubeRecommendationList({super.key});

  @override
  YoutubeRecommendationListState createState() => YoutubeRecommendationListState();
}

class YoutubeRecommendationListState extends State<YoutubeRecommendationList> {
  final String apiKey = 'AIzaSyDhXT-_EASXnbInRhZccH_Kwlh6kdyoW80';
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
    final String url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          videoData = json.decode(response.body)['items'][0]['snippet'];
          isLoading = false;
        });
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
      return Center(child: CircularProgressIndicator());
    } else if (hasError) {
      return Center(child: Icon(Icons.error));
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (videoData!['thumbnails'] != null)
              Image.network(
                videoData!['thumbnails']['default']['url'],
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
                  return Icon(Icons.error);
                },
              )
            else
              Icon(Icons.error),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoData!['title'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('by ${videoData!['channelTitle']}'),
                  Text('Published on ${videoData!['publishedAt']}'),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
