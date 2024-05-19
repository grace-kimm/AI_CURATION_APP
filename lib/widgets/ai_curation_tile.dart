import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AICurationTile extends StatelessWidget {
  final String icon;
  final String name;
  final String description;
  final String? flag; // 'flag'를 nullable로 변경
  final String url;

  const AICurationTile({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
    this.flag, // 'flag'를 선택 사항으로 설정
    required this.url,
  });

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              if (flag != null) // flag가 null이 아닌 경우에만 표시
                Text(
                  flag!,
                  style: const TextStyle(fontSize: 24.0), // 국기 이모지 크기
                ),
            ],
          ),
        ),
      ),
    );
  }
}
