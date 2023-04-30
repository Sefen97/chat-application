import 'package:chat_application/network/firemase_call/firebase_call.dart';
import 'package:chat_application/ui/screens/chat_screen/massage_stream_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shere_functions/push_to.dart';
import '../welcom_screen/welcome_screen.dart';

class ChatBodyWidget extends StatefulWidget {
  const ChatBodyWidget({Key? key}) : super(key: key);

  @override
  State<ChatBodyWidget> createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {
  late User _signUser;

  TextEditingController massageController = TextEditingController();

  @override
  void initState() {
    _getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          MassageStreamBuilderWidget(
              firestore: FireBaseCall().firestore, signUser: _signUser),
          const Divider(color: Colors.orange, thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                massageWidget(),
                const SizedBox(
                  width: 10,
                ),
                sendWidget()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _getCurrentUser() {
    try {
      final user = FireBaseCall().auth.currentUser;
      if (user != null) {
        _signUser = user;
        if (kDebugMode) {
          print(_signUser.email);
          print("get current user 3 ");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  PreferredSizeWidget _appBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Chat Massage"),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => pushToAndReplacement(
                  context: context, screenName: const WelcomeScreen())),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print("hello");
                }
              },
              icon: const Icon(Icons.email))
        ],
      );

  Widget massageWidget() => Expanded(
        child: TextFormField(
          controller: massageController,
          onChanged: (value) {
            // massageController.text = value;
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
              hintText: "Write your massage ", border: InputBorder.none),
        ),
      );

  Widget sendWidget() => InkWell(
      onTap: () {
        if (massageController.text != "") {
          FireBaseCall().addMassage(
              text: massageController.text, sender: _signUser.email.toString());
          massageController.clear();
        }
      },
      child: const Text("Send",
          style: TextStyle(color: Colors.indigo, fontSize: 20)));
}
