import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url ,@required String? token}) async {
    
     Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there was a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> Post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers
    );
    if(response.statusCode==200){
         Map<String,String> data =  jsonDecode(response.body);
         return data;
    }
    else{
      throw Exception('there is a problem with the status code${response.statusCode} with the body${jsonDecode(response.body)}');
    }
   
  }

   Future<dynamic> Put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers
    );
    if(response.statusCode==200){
         Map<String,String> data =  jsonDecode(response.body);
         return data;
    }
    else{
      throw Exception('there is a problem with the status code${response.statusCode} with the body${jsonDecode(response.body)}');
    }
   
  }
}
