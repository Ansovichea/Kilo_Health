import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              image(),
              SizedBox(
                height: 10,
              ),
              question(),
              SizedBox(
                height: 10,
              ),
              description(),
              SizedBox(
                height: 20,
              ),
              scoialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}

//app bar
AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text(
      'What is lumbar spine disease?',
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

//image
Widget image() {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
              height: 171,
              width: 380,
              fit: BoxFit.cover),
        ),
      ],
    ),
  );
}

//question
Widget question() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 10,
      ),
      Text(
        'What is  spine disease?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
//description

Widget description() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health tips: If you have a stomach ache, stop eating all these foods because this type of food will make your stomach ache.',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 119, 119, 119),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text.rich(TextSpan(
            text:
                '1. Reduce your intake of sour and spicy foods, high in fat, caffeinated beverages and orange juice, reduce the. \n'
                '2. Stop smoking because secondhand smoke destroys the health of the lungs and stomach, causing worsening stomach. \n'
                '3. Stop smoking because secondhand smoke destroys the health of the lungs and stomach, causing worsening stomach. \n'
                '4. Stop smoking because secondhand smoke destroys the health of the lungs and stomach, causing worsening stomach. \n'
                '5. Stop smoking because secondhand smoke destroys the health of the lungs and stomach, causing worsening stomach. \n',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 119, 119, 119),
            ))),
        Text(
          'Article by: KiloHealth',
          style: TextStyle(
              color: Color.fromARGB(255, 96, 96, 96),
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget scoialMedia() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Share to social media',
          style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 96, 96, 96),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.blue,
              size: 50,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.telegram,
              color: Colors.lightBlue,
              size: 50,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.link,
              color: Colors.blue,
              size: 50,
            ),
          ],
        ),
      ],
    ),
  );
}
