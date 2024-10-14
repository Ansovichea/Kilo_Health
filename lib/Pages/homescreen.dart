import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:kiloheart/Pages/detail.dart';
import 'package:kiloheart/Pages/search_screen.dart';
import 'package:kiloheart/class_icon&image/categories.dart';
import 'package:kiloheart/class_icon&image/controllImge.dart';
import 'package:kiloheart/model/apimodel.dart';
import 'package:kiloheart/model/model.dart';
import 'package:kiloheart/model/model_cotegery.dart';
import 'package:kiloheart/model/model_slideimage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<ListBlog> datalist = [];
  List<CategoryDataModel> datalist_categary = [];
  SliderDataModel datalist_slide = SliderDataModel(
    description: "",
    slides: [],
    name: '',
    facebook: '',
    telegram: '',
    tiktok: '',
    youtube: '',
    email: '',
    phoneNumbers: [],
  );

  @override
  void initState() {
    super.initState();
    getGrid();
    getData();
    getCategary();
    getSlide();
    tabController =
        TabController(vsync: this, length: datalist_categary.length);
  }

  void getGrid() async {
    final res = await api.getBlogList();
    setState(() {
      datalist = res ?? [];
    });
  }

  void getSlide() async {
    final res_slide = await api_slide.getSlide_Images();
    setState(() {
      datalist_slide = res_slide;
    });
  }

  void getCategary() async {
    final res_c = await api_categart.getData_categary();
    setState(() {
      datalist_categary = res_c ?? [];
    });
  }

  bool isLoading = false;
  final api = ApiService();
  final api_categart = ApiService_Categary();
  final api_slide = Apiservice_Slide();
  void getData() {
    setState(() {
      isLoading = true;
    });
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
          datalist_slide.slides.isNotEmpty
              ? slideImage(datalist_slide)
              : Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
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
            child: categoriesList(tabController, datalist_categary),
          ),
          information(datalist, isLoading),
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
    child: InkWell(
      onTap: () {
        Get.to(() => SearchScreen());
      },
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
          hintStyle: TextStyle(
              fontSize: 18, color: Color.fromARGB(164, 136, 136, 136)),
        ),
      ),
    ),
  );
}

// Image Slideshow
Widget slideImage(SliderDataModel datasliderlist) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: datasliderlist.slides.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item,
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
                // errorBuilder: (BuildContext context, Object exception,
                //     StackTrace? stackTrace) {
                //   return Center(child: Text('Failed to load image'));
                // },
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
Widget categoriesList(
    TabController tabController, List<CategoryDataModel> datalist_categary) {
  return Container(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: datalist_categary.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    datalist_categary[index].icon != null
                        ? datalist_categary[index].icon.toString()
                        : 'https://cdn-icons-png.flaticon.com/512/2966/2966327.png',
                    height: 35, // Use a default icon if null
                  ),
                  SizedBox(height: 8),
                  Text(
                    datalist_categary[index].name.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
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
Widget information(List<ListBlog> datalist, bool isLoading) {
  return Container(
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
      itemCount: datalist.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(() => Detail(id: datalist[index].id!));
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    child: Image.network(
                      datalist[index].thumbnail.toString(),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
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
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: Icon(Icons.error)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datalist[index].name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        datalist[index].description.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
