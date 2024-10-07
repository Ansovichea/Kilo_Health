import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';

class ChatScreen extends StatefulWidget {
  final String doctorName;
  final String doctorPicture;

  ChatScreen({required this.doctorName, required this.doctorPicture});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user-1');
  final types.User _doctor = const types.User(id: 'doctor-1');

  @override
  void initState() {
    super.initState();
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      id: const Uuid().v4(),
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
  }

  void _handleAttachmentPressed() async {
    // Let the user pick a file
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      // Check if it's an image or other type of file
      if (file.extension == 'jpg' || file.extension == 'png') {
        final imageMessage = types.ImageMessage(
          author: _user,
          id: const Uuid().v4(),
          name: file.name,
          size: file.size,
          uri: file.path!,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        setState(() {
          _messages.insert(0, imageMessage);
        });
      } else {
        final fileMessage = types.FileMessage(
          author: _user,
          id: const Uuid().v4(),
          name: file.name,
          size: file.size,
          uri: file.path!,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        setState(() {
          _messages.insert(0, fileMessage);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.doctorName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                onPressed: () {},
              )),
          SizedBox(width: 10),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blue,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Call to doctor
                },
              )),
          SizedBox(width: 10),
        ],
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        onAttachmentPressed:
            _handleAttachmentPressed, // Handles sending files and images
        user: _user,
      ),
    );
  }
}
