import 'package:chat_application/network/firemase_call/firebase_call.dart';
import 'package:chat_application/ui/screens/chat_screen/massage_stream_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../shere_functions/push_to.dart';
class ChatBodyWidget extends StatefulWidget {
  final String userId;
  const ChatBodyWidget({Key? key,required this.userId}) : super(key: key);

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
            userId: widget.userId,
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
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => pop(context: context)),
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

  Widget sendWidget() => GestureDetector(
      onTap: () {
        if (massageController.text != "") {
          FireBaseCall().addMassage(
            userId: widget.userId,
              text: massageController.text.trim(), sender: _signUser.email.toString().trim());
          massageController.clear();
        }
      },
      child: const Icon(Icons.send_sharp,color: Colors.orange,));
}
