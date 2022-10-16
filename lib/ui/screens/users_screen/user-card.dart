import 'package:flutter/material.dart';

class UsersCard extends StatelessWidget {
  final String userName;

  const UsersCard({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
