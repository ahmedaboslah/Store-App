import 'dart:convert';

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class CateogiresService {
  Future<List<ProductModel>> getcateogiresProducts(
      {required String cateogirename}) async {
     List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$cateogirename');

    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(
        ProductModel.fromJson(
          data[i],
        ),
      );
    }
    return productlist;
  }
}
