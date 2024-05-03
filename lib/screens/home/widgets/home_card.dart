import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';

import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/detail/detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeCard extends StatelessWidget {
  final NewsModel newsObject;
  const HomeCard({super.key, required this.newsObject});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(newsObject.publishedAt!);
    String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(news: newsObject)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0, left: 16.0),
        height: 400.0,
        width: 320.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Hero(
              tag: newsObject.title!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(newsObject.urlToImage!),
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            newsObject.title!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const Divider(color: Colors.white, thickness: 1),
                          Text(
                            "${newsObject.source!.name} - $formattedDate",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
