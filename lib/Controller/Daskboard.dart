import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:kiloheart/Pages/homescreen.dart';
import 'package:kiloheart/Pages/message_screen.dart';
import 'package:kiloheart/Pages/notification.dart';
import 'package:kiloheart/Pages/profile_screen.dart';
import 'package:kiloheart/Pages/search_screen.dart';

class Daskboard extends StatefulWidget {
  const Daskboard({super.key});

  @override
  State<Daskboard> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Daskboard> {
  final listscreen = [
    Homescreen(),
    MessageScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  int currentindex = 0;
  void ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listscreen[currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          selectedFontSize: 15,
          unselectedFontSize: 15,
          unselectedItemColor: Color.fromARGB(255, 192, 192, 189),
          selectedItemColor: Color.fromARGB(180, 0, 172, 234),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: ontap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
