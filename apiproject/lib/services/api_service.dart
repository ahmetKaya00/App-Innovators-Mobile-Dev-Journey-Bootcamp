import 'package:apiproject/Models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  static const String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> fetchProducts() async{
    final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    }else{
      throw Exception("Ürünler Yüklenemedi.");
    }
  }
}