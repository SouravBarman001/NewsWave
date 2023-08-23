class Article {
  final ArticleSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: ArticleSource(
        id: json['source']['id'] ?? '',
        name: json['source']['name'] ?? '',
      ),
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? 'https://static.vecteezy.com/system/resources/previews/023/914/428/original/no-document-or-data-found-ui-illustration-design-free-vector.jpg',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

class ArticleSource {
  final String id;
  final String name;

  ArticleSource({
    required this.id,
    required this.name,
  });
}