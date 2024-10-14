import 'dart:convert';

import 'package:kiloheart/constants/api.dart';
import 'package:kiloheart/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // static String url = BASE_URL + LIST_BLOG_ENDPOINT_URL;
  // // List<ListBlog> blogList = [];

  // // Future<List<ListBlog>> fetchData() async {
  // //   try {
  // //     final response = await http.get(Uri.parse(url));
  // //     var data = jsonDecode(response.body.toString());

  // //     if (response.statusCode == 200) {
  // //       print(jsonDecode(response.body));
  // //       for (Map<String, dynamic> index in data) {
  // //         blogList.add(ListBlog.fromJson(index));
  // //       }
  // //       return blogList;
  // //     } else {
  // //       throw Exception('Failed to load data from the server');
  // //     }
  // //   } on Exception catch (e) {
  // //     print('Error fetching data: $e');
  // //     return [];
  // //   }
  // // }
  Future<List<ListBlog>> getBlogList() async {
    final response =
        await http.get(Uri.parse(BASE_URL + LIST_BLOG_ENDPOINT_URL));
    if (response.statusCode == 200) {
      var data = utf8.decode(response.bodyBytes);
      print("============= >>> ${data.toString()}");
      final jsonData = json.decode(data);
      final dataList = jsonData["data"] as List;
      return dataList.map((e) => ListBlog.fromJson(e)).toList();
    } else {
      throw Exception('==============>>> Failed to load data from the server');
    }
  }

  Future<ListBlog> getBlogById(int id) async {
    final response =
        await http.get(Uri.parse('$BASE_URL$LIST_BLOG_ENDPOINT_URL/$id'));
    if (response.statusCode == 200) {
      var data = utf8.decode(response.bodyBytes);
      final jsonData = json.decode(data);
      return ListBlog.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load blog details');
    }
  }
}
