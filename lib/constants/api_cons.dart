import 'dart:math';

int maxPageFunc() {
  return Random().nextInt(8) + 1;
}

int maxPageFunc2() {
  return Random().nextInt(20) + 1;
}

String API_KEY = "YOUR_API_KEY";

String TrendApi() {
  return "https://newsapi.org/v2/everything?q=e&sortBy=popularity&pageSize=5&page=${maxPageFunc2()}&apiKey=$API_KEY";
}

String LocalApi() {
  return "https://newsapi.org/v2/top-headlines?country=tr&pageSize=5&page=${maxPageFunc()}&apiKey=$API_KEY";
}

String MostRecentlyApi() {
  return "https://newsapi.org/v2/everything?q=a&from=2024-04-25&pageSize=5&sortBy=publishedAt&page=${maxPageFunc2()}&apiKey=$API_KEY";
}
