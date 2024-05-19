import 'package:flutter/material.dart';
import 'ai_curation_tile.dart';

class AICurationList extends StatelessWidget {
  const AICurationList({super.key});

  final List<Map<String, String>> aiServices = const [
    {
      'name': 'Chat GPT',
      'description': '모든 주제로 대화할 수 있어요.',
      'flag': '🇺🇸',
      'icon': 'assets/chatgpt.png',
      'url': 'https://chatgpt.com/',
    },
    {
      'name': 'DeepL',
      'description': '번역을 잘해요.',
      'flag': '🇩🇪',
      'icon': 'assets/deepl.png',
      'url': 'https://www.deepl.com/',
    },
    {
      'name': 'Lilys',
      'description': '모든 주제로 대화할 수 있어요.',
      'flag': '🇰🇷',
      'icon': 'assets/lilys.jpeg',
      'url': 'https://www.lilys.com/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: aiServices.length,
      itemBuilder: (context, index) {
        final service = aiServices[index];
        return AICurationTile(
          key: ValueKey(service['name']), // 고유한 키를 생성하여 전달합니다.
          icon: service['icon']!,
          name: service['name']!,
          description: service['description']!,
          flag: service['flag']!,
          url: service['url']!,
        );
      },
    );
  }
}
