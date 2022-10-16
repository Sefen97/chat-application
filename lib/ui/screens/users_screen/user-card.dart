import 'package:chat_application/ui/screens/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatelessWidget {
  final String userName;
  final String userId;

  const UsersCard({Key? key, required this.userName,required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatScreen(userId: userId,))),
        child: Material(
            elevation: 10,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                userName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )),
      ),
    );
  }
}
