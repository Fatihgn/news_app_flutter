class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  NewsModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'] ?? 'Unknown';
    title = json['title'] ?? 'no title';
    description = json['description'] ?? 'No description';
    url = json['url'] ?? 'no url';
    urlToImage = json['urlToImage'] ??
        'https://ae01.alicdn.com/kf/Hcfbd6dcf78a44986b9a04e81551d33f1F/Retro-ngilizce-gazete-eski-gazete-Ins-foto-raf-sahne-i-ek-ambalaj-ka-d-foto-raf.jpg';
    publishedAt = json['publishedAt'] ?? 'Unknown';
    content = json['content'] ?? 'Unknown';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'Unknown';
    name = json['name'] ?? 'Unknown';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
