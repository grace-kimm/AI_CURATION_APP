import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ai_curation_tile.dart';
import '../main.dart';

class AICurationList extends StatelessWidget {
  const AICurationList({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    final List<Map<String, dynamic>> aiServices = [
      {
        'name': 'Chat GPT',
        'description_eng': 'You can talk about any topic.',
        'description_kor': '모든 주제로 대화할 수 있어요.',
        'flag': '🇺🇸',
        'icon': 'assets/chatgpt.png',
        'url': 'https://chatgpt.com/',
      },
      {
        'name': 'DeepL',
        'description_eng': 'Excellent at translation.',
        'description_kor': '번역을 잘해요.',
        'flag': '🇩🇪',
        'icon': 'assets/deepl.png',
        'url': 'https://www.deepl.com/',
      },
      {
        'name': 'Lilys',
        'description_eng': 'You can talk about any topic.',
        'description_kor': '모든 주제로 대화할 수 있어요.',
        'flag': '🇰🇷',
        'icon': 'assets/lilys.jpeg',
        'url': 'https://lilys.ai/',
      },
      {
        'name': 'Auto Draw',
        'description_eng': 'I can turn your doodles into beautiful drawings.',
        'description_kor': '내가 대충 그린 그림을 멋지게 그려줘요.',
        'flag': null,
        'icon': 'assets/autodraw.png',
        'url': 'https://www.autodraw.com/',
      },
      {
        'name': 'Capcut',
        'description_eng': 'I edit your videos in an appealing way.',
        'description_kor': '내 숏츠 영상을 매력적으로 편집해요.',
        'flag': null,
        'icon': 'assets/capcut.png',
        'url': 'https://www.capcut.com/',
      },
      {
        'name': 'SciSpace',
        'description_eng': 'Excellent at paper search/translation.',
        'description_kor': '논문 검색/번역에 특화 되었어요.',
        'flag': null,
        'icon': 'assets/scispace.png',
        'url': 'https://www.scispace.com/',
      },
    ];

    return ListView.builder(
      itemCount: aiServices.length,
      itemBuilder: (context, index) {
        final service = aiServices[index];
        final description = languageProvider.language == 'ENG'
            ? service['description_eng']!
            : service['description_kor']!;
        return AICurationTile(
          key: ValueKey(service['name']),
          icon: service['icon']!,
          name: service['name']!,
          description: description,
          flag: service['flag'],
          url: service['url']!,
        );
      },
    );
  }
}