import 'dart:convert';

class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
  });

  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
      id: jsondata['id'],
      description: jsondata['description'],
      image: jsondata['image'],
      price: jsondata['price'],
      title: jsondata['title'],
      rating: RatingModel.fromJson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsondata){
    return RatingModel(count: jsondata['count'], rate: jsondata['rate']);
  }
}
