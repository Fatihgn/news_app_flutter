import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/news_category_api_provider.dart';
import 'package:news_app/screens/news_list/new_list.dart';

class CategoryCard extends ConsumerWidget {
  CategoryModel cate;
  CategoryCard({super.key, required this.cate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref
            .read(newsCategoryProvider.notifier)
            .fetchNewsByCategory(cate.categoryName.toLowerCase());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewList(cate: cate)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8.0, left: 8.0),
        width: 270.0,
        decoration: BoxDecoration(
          color: Color(cate.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/${cate.imageUrl}",
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
              Text(
                cate.categoryName,
                style: TextStyle(
                  fontFamily: GoogleFonts.cormorantGaramond().fontFamily,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
