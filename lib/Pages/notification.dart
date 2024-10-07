import 'package:flutter/material.dart';
import 'package:kiloheart/class_icon&image/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: getnotificationData.isNotEmpty
            ? informationNotification()
            : nullNotification());
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text(
      'Notification',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      color: Colors.white,
    ),
    actions: [
      TextButton(
          onPressed: () {},
          child: Text(
            'Clear all',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ))
    ],
  );
}

Widget informationNotification() {
  final notification = getnotificationData;
  return ListView.builder(
      itemCount: getnotificationData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              notification[index].image,
            ),
          ),
          title: Text(
            notification[index].title,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            notification[index].date,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        );
      });
}

Widget nullNotification() {
  return Center(
    child: Icon(Icons.home),
  );
}
