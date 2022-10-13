import 'package:chat_application/ui/screens/chat_screen/chat_body_widget.dart';
import 'package:flutter/material.dart';

import '../../../shere_functions/push_to.dart';
import '../welcom_screen/welcome_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return  const ChatBodyWidget();
  }


}
