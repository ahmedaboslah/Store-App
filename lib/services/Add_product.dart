import 'package:flutter/foundation.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addproduct (
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String Category}) async {
   Map<String,dynamic> data =await Api().Post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': Category
        },);
        return ProductModel.fromJson(data);
  }
}
