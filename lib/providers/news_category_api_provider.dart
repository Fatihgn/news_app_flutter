import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/api_cons.dart';
import 'package:news_app/models/news_model.dart';

class NewsCategoryApiNotifier extends StateNotifier<List<NewsModel>> {
  NewsCategoryApiNotifier() : super([]);

  bool isLoading = true;

  void fetchNewsByCategory(String category) async {
    isLoading = true;
    state = [];
    final List<NewsModel> loadedNews = [];
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$API_KEY');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        for (final article in articles) {
          NewsModel news = NewsModel.fromJson(article);
          if (news.title != "[Removed]") {
            loadedNews.add(news);
          }
        }

        state = loadedNews;
        isLoading = false;
      }
    } catch (err) {
      print(err);
    }
  }

  void fetchNewsBySearch(String category, String search) async {
    isLoading = true;
    state = [];
    final List<NewsModel> loadedNews = [];
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?q=$search&country=us&category=$category&apiKey=$API_KEY');
    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        for (final article in articles) {
          NewsModel news = NewsModel.fromJson(article);
          if (news.title != "[Removed]") {
            loadedNews.add(news);
          }
        }

        state = loadedNews;
        isLoading = false;
      }
    } catch (err) {
      print(err);
    }
  }
}

final newsCategoryProvider =
    StateNotifierProvider<NewsCategoryApiNotifier, List<NewsModel>>(
        (ref) => NewsCategoryApiNotifier());
