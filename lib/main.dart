import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'widgets/ai_curation_list.dart';
import 'widgets/youtube_recommendation_list.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LanguageProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Curation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Pretendard'),
          bodyMedium: TextStyle(fontFamily: 'Pretendard'),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class LanguageProvider with ChangeNotifier {
  bool isEnglish = true;

  String get language => isEnglish ? 'ENG' : 'KOR';

  void toggleLanguage() {
    isEnglish = !isEnglish;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Curation',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => languageProvider.toggleLanguage(),
            child: Text(
              'ENG',
              style: TextStyle(
                color: languageProvider.language == 'ENG' ? Colors.white : Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => languageProvider.toggleLanguage(),
            child: Text(
              'KOR',
              style: TextStyle(
                color: languageProvider.language == 'KOR' ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              languageProvider.language == 'ENG'
                  ? 'Click to use AI services.'
                  : '클릭 하면 AI 서비스를 사용할 수 있어요.',
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'APPS'),
                        Tab(text: 'Youtube'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AICurationList(),
                          YoutubeRecommendationList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
