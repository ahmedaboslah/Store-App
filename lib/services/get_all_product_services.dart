import 'dart:convert';

import 'package:http/http.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class GetAllProductsServices {
  Future<List<ProductModel>> getallprodeucts() async {
  List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products');
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
