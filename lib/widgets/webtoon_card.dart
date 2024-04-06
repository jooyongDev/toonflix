import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../screens/detail_screen.dart';

class WebtoonCard extends StatelessWidget {
  const WebtoonCard({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const DetailScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                final offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              settings: RouteSettings(
                arguments: {
                  'title': webtoon.title,
                  'thumb': webtoon.thumb,
                  'id': webtoon.id,
                },
              ),
            ));
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              width: 250,
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
