import 'package:chat_application/ui/screens/chat_screen/message_line_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MassageStreamBuilderWidget extends StatefulWidget {
  final FirebaseFirestore firestore;
  final User signUser;
  final String userId;

  const MassageStreamBuilderWidget(
      {Key? key,
      required this.firestore,
      required this.signUser,
      required this.userId})
      : super(key: key);

  @override
  State<MassageStreamBuilderWidget> createState() =>
      _MassageStreamBuilderWidgetState();
}

class _MassageStreamBuilderWidgetState
    extends State<MassageStreamBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: widget.firestore
          .collection("users")
          .doc(widget.userId.toString())
          .collection("massages")
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MassageLineWidget> list = [];
          final listOfDocs = snapshot.data!.docs.reversed;
          for (var doc in listOfDocs) {
            final userId = doc.get("userId");
            final massage = doc.get("massage");
            final currentId = widget.signUser.email;
            final user = MassageLineWidget(
              isMe: currentId == userId,
              massageSender: userId,
              massageText: massage,
            );
            list.add(user);
          }

          return ListView(
            reverse: true,
            children: list,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
