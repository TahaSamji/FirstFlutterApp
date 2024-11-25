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
    
      name:json['source']['name'] ?? "No Name Available",
      author: json['author']  ?? "Unknown Author",
      title: json['title']  ?? "No title Available",
      description: json['description']  ?? "No description available",
      url: json['url']  ?? "",
      urlToImage: json['urlToImage'] ?? "No Image",
     publishedAt: json['publishedAt'] != null ? DateTime.parse(json['publishedAt']) : DateTime.now(),
      content: json['content'] ?? "No additional content available",
    );
  }
}

