import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Product {
  final String productTitle;
  final String price;
  final bool disBool;
  final String disPrice;
  final String productId;
  final String storeId;
  final String thumbnail;
  final String category;
  final bool visibility;

  Product({
    required this.productTitle,
    required this.price,
    required this.disBool,
    required this.disPrice,
    required this.productId,
    required this.storeId,
    required this.thumbnail,
    required this.category,
    required this.visibility,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productTitle: json['product_title'],
      price: json['price'],
      disBool: json['dis_bool'] == 'true',
      disPrice: json['dis_price'],
      productId: json['product_id'],
      storeId: json['store_id'],
      thumbnail: json['thumbnail'],
      category: json['category'],
      visibility: json['visibility'] == 'true',
    );
  }
}
Future<List<Product>> fetchData(url) async {
  final response = await http.get(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accesstoken_auth': '0cB!d*oKx291-D8%D&Ji+a2I!KcqSJn\$-#ns2j2%lmowH2H1NjdK3*jd2n3sd3xHS291e+uj2^!dfcfh-*hjd\$8#dhbhc-)uAh+!@lJ7-#LzV4jx%1k!k1ow-#ns2j2%9e+ujf\$8#df='
      }
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List<Product> productList = (jsonData['data'] as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return productList;
  } else {
    throw Exception('Failed to load data');
  }
}
