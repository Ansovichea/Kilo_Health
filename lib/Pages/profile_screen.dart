import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1025px-Cat03.jpg'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Chea',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(Icons.favorite, 'Heart rate', '215bpm'),
                    _buildStatItem(
                        Icons.local_fire_department, 'Calories', '756cal'),
                    _buildStatItem(Icons.fitness_center, 'Weight', '103lbs'),
                  ],
                ),
                SizedBox(height: 20),
                _buildListItem(Icons.bookmark, 'My Saved'),
                _buildListItem(Icons.calendar_today, 'Appointmnet'),
                _buildListItem(Icons.payment, 'Payment Method'),
                _buildListItem(Icons.question_answer, 'FAQs'),
                _buildListItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        Text(label,
            style: TextStyle(
              color: Colors.blue,
            )),
        Text(value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
      ],
    );
  }

  Widget _buildListItem(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 1,
        shadowColor: Colors.blue,
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue[100],
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 25,
            ),
          ),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> profileOptions = [
//       {'icon': Icons.bookmark, 'title': 'My Saved'},
//       {'icon': Icons.calendar_today, 'title': 'Appointment'},
//       {'icon': Icons.payment, 'title': 'Payment Method'},
//       {'icon': Icons.question_answer, 'title': 'FAQs'},
//       {'icon': Icons.logout, 'title': 'Logout'},
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
//           child: Column(
//             children: [
//               const CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1025px-Cat03.jpg'),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Chea',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildStatItem(Icons.favorite, 'Heart rate', '215bpm'),
//                   _buildStatItem(
//                       Icons.local_fire_department, 'Calories', '756cal'),
//                   _buildStatItem(Icons.fitness_center, 'Weight', '103lbs'),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: profileOptions.length,
//                   separatorBuilder: (context, index) {
//                     return const Divider(
//                       color: Colors.blue,
//                       thickness: 1,
//                       indent: 20,
//                       endIndent: 20,
//                     );
//                   },
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       leading: Icon(
//                         profileOptions[index]['icon'],
//                         size: 30,
//                         color: Colors.blue,
//                       ),
//                       title: Text(profileOptions[index]['title']),
//                       onTap: () {
//                         // Handle tap here
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatItem(IconData icon, String label, String value) {
//     return Column(
//       children: [
//         Icon(icon, size: 40, color: Colors.blue),
//         Text(
//           label,
//           style: const TextStyle(color: Colors.blue),
//         ),
//         Text(
//           value,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
// }
