import 'dart:convert';

import 'package:crud_app_frontend/model/product.dart';
import 'package:crud_app_frontend/pages/update_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "https://sleepy-pajamas-foal.cyclic.app/api/product/";

  // POST method
  static addProduct(Map productData) async {
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final response = await http.post(url, body: productData);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // GET Method
  static Future<List<Product>> getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Check if the response is a list
        if (data is List) {
          List<dynamic> productList = data;

          productList.forEach((value) {
            products.add(Product(
                id: value['_id'].toString(),
                name: value['name'],
                price: value['price'].toString(),
                description: value['description']));
          });
        } else {
          print("Response is not a list of products.");
        }

        return products;
      } else {
        // Handle non-200 status code if needed
        print("Non-200 status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during getProduct: $e");
      return [];
    }
  }


  // UPDATE Method
  static updateProduct(id, body, context) async {
    var url = Uri.parse("${baseUrl}update_product/$id");
    final response = await http.patch(url, body: body);

    // print("Response status code: ${response.statusCode}");
    // print("Response body: ${response.body}");

    try {
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const UpdateProduct(),
          ),
        );
      } else {
        print("Failed to update data");
      }
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  //DELETE Method
  static Future<void> deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete_product/$id");
    final response = await http.delete(url);
    if (response.statusCode == 204) {
      print("Product deleted successfully");
    } else {
      print("Failed to delete product!. Status code: ${response.statusCode}");
    }
  }

}
