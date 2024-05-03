import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/constants/api_cons.dart';
import 'package:news_app/models/news_model.dart';

class NewsApiNotifier extends StateNotifier<List<NewsModel>> {
  NewsApiNotifier() : super([]) {
    fetchNews(TrendApi());
  }

  void fetchNews(String apiurl) async {
    state = [];
    final List<NewsModel> loadedNews = [];
    final url = Uri.parse(apiurl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        for (final article in articles) {
          NewsModel news = NewsModel.fromJson(article);
          loadedNews.add(news);
        }

        state = loadedNews;
      }
    } catch (err) {
      print(err);
    }
  }
}

final newsProvider = StateNotifierProvider<NewsApiNotifier, List<NewsModel>>(
    (ref) => NewsApiNotifier());
