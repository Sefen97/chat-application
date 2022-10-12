import 'package:chat_application/shere_functions/push_to.dart';
import 'package:flutter/material.dart';

class ChatBodyWidget extends StatefulWidget {
  const ChatBodyWidget({Key? key}) : super(key: key);

  @override
  State<ChatBodyWidget> createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Chat Massage"),
        leading: const Icon(Icons.mail, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => pop(context: context)),
          ),
        ],
      );
}
