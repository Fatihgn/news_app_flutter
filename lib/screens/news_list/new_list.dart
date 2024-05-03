import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_api_provider.dart';
import 'package:news_app/providers/news_category_api_provider.dart';
import 'package:news_app/screens/home/widgets/categories_card.dart';
import 'package:news_app/screens/news_list/widgets/news_card2.dart';

class NewList extends ConsumerWidget {
  final CategoryModel cate;
  const NewList({super.key, required this.cate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<NewsModel> newsList = ref.watch(newsCategoryProvider);
    final bool isLoading = ref.watch(newsCategoryProvider.notifier).isLoading;

    Widget content = Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.7,
        ),
        const Center(
          child: Text('No news found'),
        ),
      ],
    );

    if (newsList.isNotEmpty) {
      content = Expanded(
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsCard2(newsObject: newsList[index]);
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cormorantGaramond().fontFamily,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref
                    .read(newsCategoryProvider.notifier)
                    .fetchNewsBySearch(cate.categoryName.toLowerCase(), value);
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                filled: true,
                hintText: 'Search News',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            isLoading
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.7,
                      ),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  )
                : content
          ],
        ),
      ),
    );
  }
}
