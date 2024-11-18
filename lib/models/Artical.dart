class Article {
  
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    
    required this.name,
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
    
      name:json['source']['name'] ?? "Hi",
      author: json['author']  ?? "Unknown Author",
      title: json['title']  ?? "Hi",
      description: json['description']  ?? "Hi",
      url: json['url']  ?? "Hi",
      urlToImage: json['urlToImage'] ?? "Hi",
     publishedAt: json['publishedAt'] != null ? DateTime.parse(json['publishedAt']) : DateTime.now(),
      content: json['content'] ?? "Hi",
    );
  }
}

