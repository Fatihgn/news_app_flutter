import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/api_cons.dart';
import 'package:news_app/providers/active_button_provider.dart';
import 'package:news_app/providers/news_api_provider.dart';

class ButtonNews extends ConsumerWidget {
  const ButtonNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ActiveButton activeButton = ref.watch(activeButtonProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            ref
                .read(activeButtonProvider.notifier)
                .changeActiveButton(ActiveButton.trend);

            ref.read(newsProvider.notifier).fetchNews(TrendApi());
          },
          style: TextButton.styleFrom(
            shape: (activeButton == ActiveButton.trend)
                ? LinearBorder.bottom(
                    side: const BorderSide(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                  )
                : null,
          ),
          child: const Text(
            "Trend News",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(activeButtonProvider.notifier)
                .changeActiveButton(ActiveButton.mostRecently);
            ref.read(newsProvider.notifier).fetchNews(MostRecentlyApi());
          },
          style: TextButton.styleFrom(
            shape: (activeButton == ActiveButton.mostRecently)
                ? LinearBorder.bottom(
                    side: const BorderSide(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                  )
                : null,
          ),
          child: const Text(
            "Most Recently News",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(activeButtonProvider.notifier)
                .changeActiveButton(ActiveButton.local);
            ref.read(newsProvider.notifier).fetchNews(LocalApi());
          },
          style: TextButton.styleFrom(
            shape: (activeButton == ActiveButton.local)
                ? LinearBorder.bottom(
                    side: const BorderSide(
                      color: Colors.brown,
                      width: 2.0,
                    ),
                  )
                : null,
          ),
          child: const Text(
            "Local News",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
