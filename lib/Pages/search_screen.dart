import 'package:flutter/material.dart';
import 'package:kiloheart/model/apimodel.dart';
import 'package:kiloheart/model/model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ListBlog> datalist = [];
  final api = ApiService();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final res = await api.getBlogList();
    setState(() {
      datalist = res ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: categoryBar(datalist),
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
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(164, 136, 136, 136),
        ),
      ),
    ),
  );
}

Widget categoryBar(List<ListBlog> datalist) {
  return DefaultTabController(
    length: datalist.length,
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
            tabs: datalist.map((blog) => Tab(text: blog.name)).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            children: datalist.map((blog) {
              return blog.name == null
                  ? Center(child: Text('No image available'))
                  : ListView.builder(
                      itemCount: 1,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blog.name.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        blog.description.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    blog.thumbnail.toString(),
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
