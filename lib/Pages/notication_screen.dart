import 'package:flutter/material.dart';
import 'package:kiloheart/class_icon&image/notication_information.dart';

class NoticationScreen extends StatefulWidget {
  const NoticationScreen({Key? key}) : super(key: key);

  @override
  State<NoticationScreen> createState() => _NoticationScreenState();
}

class _NoticationScreenState extends State<NoticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: _buildBody(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search, article, information...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.keyboard_voice_outlined, size: 28),
          hintStyle: TextStyle(
              fontSize: 18, color: Color.fromARGB(164, 136, 136, 136)),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Expanded(child: categoryBar())],
    );
  }

  Widget categoryBar() {
    final notication = notations;

    return DefaultTabController(
      length: notication.length,
      child: Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: null,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              isScrollable: true,
              tabs: List<Tab>.generate(
                notication.length,
                (index) => Tab(text: notication[index].title),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: List<Widget>.generate(
                notication.length,
                (index) => notication[index].title.isEmpty
                    ? Text("hhgh")
                    : Center(
                        child: Text(
                          'Content for ${notication[index].title}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
