import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/api_cons.dart';
import 'package:news_app/constants/categories_cons.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/active_button_provider.dart';
import 'package:news_app/providers/news_api_provider.dart';
import 'package:news_app/screens/home/widgets/button.dart';
import 'package:news_app/screens/home/widgets/categories_card.dart';
import 'package:news_app/screens/home/widgets/home_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<NewsModel> newsList = ref.watch(newsProvider);
    final activeButton = ref.watch(activeButtonProvider);
    print(newsList.length);

    String? url;

    if (activeButton == ActiveButton.local) {
      url = LocalApi();
    } else if (activeButton == ActiveButton.trend) {
      url = TrendApi();
    } else if (activeButton == ActiveButton.mostRecently) {
      url = MostRecentlyApi();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cormorantGaramond().fontFamily,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: ButtonNews(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return HomeCard(newsObject: newsList[index]);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 32.0),
                child: Text(
                  "Categories",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: categoriesList.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(cate: categoriesList[index]);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
