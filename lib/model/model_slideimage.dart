import 'dart:convert';
import 'package:kiloheart/class_icon&image/controllImge.dart';
import 'package:kiloheart/constants/api.dart';
import 'package:http/http.dart' as http;

class Apiservice_Slide {
  Future<SliderDataModel> getSlide_Images() async {
    final response =
        await http.get(Uri.parse(BASE_URL + LIST_SLIDE_ENDPOINT_URL));
    if (response.statusCode == 200) {
      print("============= Slider >>>   ${response.body}");
      var dataSlide = utf8.decode(response.bodyBytes);
      final jsonResponseSlide = json.decode(dataSlide);
      final datalistSlide =
          DataSlide.fromJson(jsonResponseSlide as Map<String, dynamic>);
      return datalistSlide.data;
    } else {
      print("=============>>>   ${response.body}");
      throw Exception('Failed to load slide images');
    }
  }
}
