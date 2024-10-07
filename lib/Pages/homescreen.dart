import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:kiloheart/Pages/detail.dart';
import 'package:kiloheart/Pages/search_screen.dart';
import 'package:kiloheart/class_icon&image/categories.dart';
import 'package:kiloheart/class_icon&image/controllImge.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: categories.length);
  }

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
            child: categoriesList(tabController),
          ),
          information(),
        ],
      ),
    );
  }
}

// AppBar
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

// Search Bar
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
        suffixIcon: IconButton(
          icon: Icon(Icons.search, size: 28),
          onPressed: () {
            Get.to(() => SearchScreen());
          },
        ),
        hintText: 'Search',
        hintStyle:
            TextStyle(fontSize: 18, color: Color.fromARGB(164, 136, 136, 136)),
      ),
    ),
  );
}

// Image Slideshow
Widget slideImage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: getHomescreen.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item.image,
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      autoPlayInterval: 3000,
      isLoop: true,
    ),
  );
}

// Categories List
Widget categoriesList(TabController tabController) {
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
              color: Colors.blue,
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
                    style: TextStyle(fontSize: 12, color: Colors.white),
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

// Information Grid
Widget information() {
  final dataHomescreen = getHomescreen;
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
        itemCount: dataHomescreen.length,
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
                      dataHomescreen[index].image,
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
                    dataHomescreen[index].title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    dataHomescreen[index].description,
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
