import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/detail/detail_screen.dart';

class NewsCard2 extends StatelessWidget {
  final NewsModel newsObject;
  const NewsCard2({super.key, required this.newsObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(news: newsObject)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8.0),
        width: double.infinity,
        height: 170.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 14,
            ),
            Hero(
              tag: newsObject.title!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  newsObject.urlToImage!,
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text(
                  newsObject.title!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 5,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
