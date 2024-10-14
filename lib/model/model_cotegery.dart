import 'dart:convert';

import 'package:kiloheart/class_icon&image/categories.dart';
import 'package:kiloheart/constants/api.dart';
import 'package:http/http.dart' as http;

class ApiService_Categary {
  Future<List<CategoryDataModel>> getData_categary() async {
    final response =
        await http.get(Uri.parse(BASE_URL + LIST_CATEGORY_ENDPOINT_URL));
    if (response.statusCode == 200) {
      var data_categary = utf8.decode(response.bodyBytes);
      final jsonResponse = json.decode(data_categary);
      final datalist_categary =
          Category_List.fromJson(jsonResponse as Map<String, dynamic>);
      return datalist_categary.data ?? [];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
