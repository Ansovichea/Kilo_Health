import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiloheart/Pages/chat_screen.dart';
import 'package:kiloheart/class_icon&image/search.dart';
import 'package:kiloheart/class_icon&image/pictureDocktor.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              titleBar(),
              pictureDoctor(),
              messagDoctor(),
            ],
          ),
        ),
      ),
    );
  }
}

// bar
AppBar appBar() {
  return AppBar(
      title: null,
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
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle,
              color: Color.fromARGB(166, 0, 172, 234), size: 35),
        ),
      ));
}

Widget titleBar() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Emergency consult with your recommended doctor',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
      ));
}

Widget pictureDoctor() {
  final pictures = getDataDoctor;
  return Container(
    height: 100,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getDataDoctor.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(pictures[index].picture),
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
  );
}

// Widget messagDoctor() {
//   final pictures = getDataDoctor;
//   return InkWell(
//     onTap: () {},
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 'All Messages',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 5),
//         Column(
//           children: [
//             Container(
//               height: 500,
//               child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   itemCount: pictures.length,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   image: NetworkImage(pictures[index].picture),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(pictures[index].name),
//                                 Container(
//                                   width: 200,
//                                   child: Text(
//                                     'You: ${pictures[index].massge}',
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }

Widget messagDoctor() {
  final pictures = getDataDoctor;
  return InkWell(
    onTap: () {}, // Remove this
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'All Messages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Column(
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: pictures.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigate to ChatScreen with doctor details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            doctorName: pictures[index].name,
                            doctorPicture: pictures[index].picture,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(pictures[index].picture),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pictures[index].name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    'You: ${pictures[index].massge}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
}
