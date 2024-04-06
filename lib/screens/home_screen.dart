import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';
import '../widgets/webtoon_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.fetchTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: makeList(snapshot),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

PageView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
  return PageView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      final WebtoonModel webtoon = snapshot.data![index];
      return WebtoonCard(webtoon: webtoon);
    },
  );
}
