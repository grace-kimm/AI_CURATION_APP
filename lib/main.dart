import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/ai_curation_list.dart';

void main() {
  runApp(const AICurationApp());
}

class LanguageProvider with ChangeNotifier {
  String _language = 'ENG'; // 기본 언어를 영어로 설정

  String get language => _language;

  void setLanguage(String language) {
    _language = language;
    notifyListeners();
  }
}

class AICurationApp extends StatelessWidget {
  const AICurationApp({super.key});

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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.language == 'ENG';

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
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ToggleButtons(
              borderColor: Colors.grey,
              selectedBorderColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.1),
              selectedColor: Colors.blue,
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
              isSelected: [isEnglish, !isEnglish],
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {
                return Text(
                  languageProvider.language == 'ENG'
                      ? 'You can use AI services by clicking.'
                      : '클릭 하면 AI 서비스를 사용할 수 있어요.',
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Expanded(child: AICurationList()),
          ],
        ),
      ),
    );
  }
}
