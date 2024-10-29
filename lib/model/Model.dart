class Post {
  final int id;
 final String description;
  final String title;
  final String thumbnail;

  Post(
      {required this.id,
      required this.description,
      required this.thumbnail,
      required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        description: json['content'],
        thumbnail: json['image']);
  }
  Map<String,dynamic> toJson(){
    return {
      'id':id,
    
      "title" : title,
      "content" :description,
    
    };
  }
}
