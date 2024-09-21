import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiloheart/Pages/detail.dart';
import 'package:kiloheart/class_icon&image/categories.dart';
import 'package:kiloheart/class_icon&image/controllImge.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35, right: 25, top: 10),
            child: searchBar(),
          ),
          SizedBox(height: 10),
          slideImage(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'All Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: categoriesList(),
          ),
          information(),
        ],
      ),
    );
  }
}

// bar
AppBar appBar() {
  return AppBar(
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: Color.fromARGB(166, 0, 172, 234),
          size: 35,
        ),
        onPressed: () {},
      ),
    ],
    leading: Row(
      children: [
        SizedBox(width: 15),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(71, 0, 172, 234),
          ),
          child: Icon(Icons.person,
              color: Color.fromARGB(166, 0, 172, 234), size: 35),
        ),
      ],
    ),
  );
}

// search bar
Widget searchBar() {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: Icon(Icons.search, size: 28),
        hintText: 'Search',
        hintStyle:
            TextStyle(fontSize: 18, color: Color.fromARGB(164, 136, 136, 136)),
      ),
    ),
  );
}

Widget slideImage() {
  final sliderimage = sliderImage();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.white,
      indicatorBackgroundColor: Colors.grey,
      children: sliderimage.urlImgae.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Center(child: Text('Failed to load image'));
            },
          ),
        );
      }).toList(),
      autoPlayInterval: 3000,
      isLoop: true,
    ),
  );
}

// Categories
Widget categoriesList() {
  final cati = categories;
  return Container(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cati.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cati[index].icon,
                    color: Colors.blue,
                    size: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    cati[index].name,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget information() {
  final image = sliderImage();
  return InkWell(
    onTap: () {
      Get.to(() => Detail());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        itemCount: image.urlImgae.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      image.urlImgae[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(child: Text('Failed to load image'));
                      },
                    ),
                  ),
                  Text(
                    'higggggggghggggggggggghghg',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'hi',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
