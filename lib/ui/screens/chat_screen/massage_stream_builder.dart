import 'package:chat_application/ui/screens/chat_screen/message_line_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MassageStreamBuilderWidget extends StatefulWidget {
  final FirebaseFirestore firestore;
  final User signUser;


  const MassageStreamBuilderWidget({Key? key, required this.firestore,required this.signUser})
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
      stream: widget.firestore.collection("masseges").orderBy('time').snapshots(),
      builder: (context, snapshot) {
        final List<MassageLineWidget> massagesWidgets = [];
        if (snapshot.hasData) {
          final massages = snapshot.data!.docs;
          for (var massage in massages) {
            final massageText = massage.get("text");
            final massageSender = massage.get("sender");
            final currentUser=widget.signUser.email;
            if(currentUser==massageSender){

            }
            final massageWidget = MassageLineWidget(
              isMe: currentUser==massageSender,
              massageSender: massageSender,
              massageText: massageText,
            );
            massagesWidgets.add(massageWidget);
          }
          return ListView(
            children: massagesWidgets,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
