import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kiloheart/class_icon&image/controllImge.dart';
import 'package:kiloheart/model/apimodel.dart';
import 'package:kiloheart/model/model.dart';
import 'package:kiloheart/constants/api.dart';
import 'package:kiloheart/model/model_slideimage.dart';

class Detail extends StatefulWidget {
  final int id;
  const Detail({Key? key, required this.id}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<ListBlog> _futureBlog;
  late Future<SliderDataModel> _futureSlideImage;
  final ApiService _apiService = ApiService();
  final Apiservice_Slide _apiservice_slide = Apiservice_Slide();

  @override
  void initState() {
    super.initState();
    _futureBlog = _apiService.getBlogById(widget.id);
    _futureSlideImage = _apiservice_slide.getSlide_Images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder<ListBlog>(
        future: _futureBlog,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final blog = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    image(blog.thumbnail),
                    SizedBox(height: 10),
                    question(blog.name),
                    SizedBox(height: 10),
                    description(blog.content),
                    SizedBox(height: 20),
                    FutureBuilder<SliderDataModel>(
                      future: _futureSlideImage,
                      builder: (context, slideSnapshot) {
                        if (slideSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (slideSnapshot.hasError) {
                          return Text('Error: ${slideSnapshot.error}');
                        } else if (slideSnapshot.hasData) {
                          return SocialShare(slideSnapshot.data!);
                        } else {
                          return Text('No slide data available');
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'Blog Detail',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 27,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white, size: 27),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget image(String? imageUrl) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          imageUrl ?? "https://via.placeholder.com/300",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget question(String? title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        Expanded(
          child: Text(
            title ?? 'No title available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget description(String? desc) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HtmlWidget(
            desc ?? 'No description available',
          ),
        ],
      ),
    );
  }
}

Widget SocialShare(SliderDataModel datalist_share) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.facebook),
          onPressed: () => _launchURL(datalist_share.facebook, 'Facebook'),
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () => _launchURL(datalist_share.youtube, 'YouTube'),
        ),
        IconButton(
          icon: Icon(Icons.telegram),
          onPressed: () => _launchURL(datalist_share.telegram, 'Telegram'),
        ),
      ],
    ),
  );
}

void _launchURL(String? url, String platform) async {
  if (url != null && url.isNotEmpty) {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not launch $platform',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  } else {
    Get.snackbar(
      'Error',
      '$platform URL is not available',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
