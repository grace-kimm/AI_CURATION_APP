import 'package:flutter/material.dart';
import 'ai_curation_tile.dart';

class AICurationList extends StatelessWidget {
  const AICurationList({Key? key}) : super(key: key);

  final List<Map<String, String?>> aiServices = const [
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
    {
      'name': 'Auto Draw',
      'description': '내가 대충 그린 그림을 멋지게 그려줘요.',
      'flag': null,
      'icon': 'assets/autodraw.png',
      'url': 'https://www.autodraw.com/',
    },
    {
      'name': 'Capcut',
      'description': '내 숏츠 영상을 매력적으로 편집해요.',
      'flag': null,
      'icon': 'assets/capcut.png',
      'url': 'https://www.capcut.com/',
    },
    {
      'name': 'SciSpace',
      'description': '논문 검색/번역에 특화 되었어요.',
      'flag': null,
      'icon': 'assets/scispace.png',
      'url': 'https://typeset.io/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: aiServices.length,
      itemBuilder: (context, index) {
        final service = aiServices[index];
        return AICurationTile(
          key: ValueKey(service['name']),
          icon: service['icon']!,
          name: service['name']!,
          description: service['description']!,
          flag: service['flag'],
          url: service['url']!,
        );
      },
    );
  }
}
