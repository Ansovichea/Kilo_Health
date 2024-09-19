import 'dart:convert';

import 'package:kiloheart/model/model.dart';
import 'package:http/http.dart' as http;

class data {
  static String url = '';
  static List<model> parseData(String responseBody) {
    var jsonData = json.decode(responseBody) as List<dynamic>;
    List<model> datalist =
        jsonData.map((data) => model.fromJson(data)).toList();
    return datalist;
  }

  Future<List<model>> fetchData() async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = parseData(response.body);
        return data;
      } else {
        throw Exception('Failed to load data from the server');
      }
    } on Exception catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
