import 'package:chat_application/ui/screens/chat_screen/chat_body_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String userId;
  const ChatScreen({Key? key,required  this.userId}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return   ChatBodyWidget(userId: widget.userId,);
  }


}
