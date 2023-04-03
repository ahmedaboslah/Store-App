  import 'package:flutter/foundation.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
class UpdateProductservice{


  Future<ProductModel> Updateproduct (
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String Category}) async {
   Map<String,dynamic> data =await Api().Put(
        url: 'https://fakestoreapi.com/products/$id',
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

