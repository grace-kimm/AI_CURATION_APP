import 'package:flutter/material.dart';
import 'widgets/ai_curation_list.dart';

void main() {
  runApp(const AICurationApp());
}

class AICurationApp extends StatelessWidget {
  const AICurationApp({super.key});

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '클릭 하면 AI 서비스를 사용할 수 있어요.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Expanded(child: AICurationList()),
          ],
        ),
      ),
    );
  }
}
