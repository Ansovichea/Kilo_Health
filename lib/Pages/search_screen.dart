import 'package:flutter/material.dart';
import 'package:kiloheart/class_icon&image/search.dart'; // Ensure this file contains the searchs list

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _NoticationScreenState();
}

class _NoticationScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: _buildBody(),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: TextField(
      decoration: InputDecoration(
        hintText: 'Search, article, information...',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.keyboard_voice_outlined, size: 28),
        hintStyle:
            TextStyle(fontSize: 18, color: Color.fromARGB(164, 136, 136, 136)),
      ),
    ),
  );
}

Widget _buildBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: categoryBar()),
    ],
  );
}

Widget categoryBar() {
  return DefaultTabController(
    length: searchs.length,
    child: Column(
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TabBar(
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            isScrollable: true,
            tabs: searchs
                .map((notification) => Tab(text: notification.title))
                .toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: searchs.map((notification) {
              return notification.images.isEmpty
                  ? Center(child: Text('No images available'))
                  : ListView.builder(
                      itemCount: notification.images.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        notification.description,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        notification.description,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    notification.images[index],
                                    fit: BoxFit.cover,
                                    height: 50,
                                    width: 150,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(child: Icon(Icons.error));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
