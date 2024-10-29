import 'package:flutter_application_1/model/Reviews.dart';


class Products {
  final int id;
  final String title;
  final double price;
  final List tags;
  final List<Reviews> reviews;
  final List images;
  final String description;
  Products(
      {required this.id,
      required this.title,
      required this.tags,
      required this.price,
      required this.reviews,
      required this.images,
       required this.description});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json["id"],
        price: json["price"],
         description: json["description"],
        title: json["title"],
        tags: json["tags"],
        reviews: (json['reviews'] as List)
            .map((review) =>
                Reviews.fromJson(review)) // Parse reviews as List<Reviews>
            .toList(),
        images: json['images']);
  }
}