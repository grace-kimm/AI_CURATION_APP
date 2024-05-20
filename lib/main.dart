import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // provider 패키지 임포트
import 'widgets/ai_curation_list.dart';

void main() {
  runApp(const AICurationApp());
}

class LanguageProvider with ChangeNotifier {
  String _language = 'KOR';

  String get language => _language;

  void setLanguage(String language) {
    _language = language;
    notifyListeners();
  }
}

class AICurationApp extends StatelessWidget {
  const AICurationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MaterialApp(
        title: 'AI Curation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Pretendard'),
            bodyMedium: TextStyle(fontFamily: 'Pretendard'),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isKorean = languageProvider.language == 'KOR';

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
        centerTitle: false, // 왼쪽 정렬
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // 마진 추가
            child: ToggleButtons(
              borderColor: Colors.grey,
              selectedBorderColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.1),
              selectedColor: Colors.blue,
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
              isSelected: [!isKorean, isKorean],
              onPressed: (index) {
                if (index == 0) {
                  languageProvider.setLanguage('ENG');
                } else {
                  languageProvider.setLanguage('KOR');
                }
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('ENG'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('KOR'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AICurationList(),
      ),
    );
  }
}
