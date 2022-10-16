import 'package:chat_application/network/firemase_call/firebase_call.dart';
import 'package:chat_application/shere_functions/push_to.dart';
import 'package:chat_application/ui/screens/users_screen/user-card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../welcom_screen/welcome_screen.dart';

class UsersScreenBodyWidget extends StatefulWidget {
  const UsersScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<UsersScreenBodyWidget> createState() => _UsersScreenBodyWidgetState();
}

class _UsersScreenBodyWidgetState extends State<UsersScreenBodyWidget> {
  late User _signUser;

  @override
  void initState() {
    _getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FireBaseCall().firestore.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!.docs;
              final List<UsersCard> usersListWidgets = [];
              for (var user in users) {
                final userName = user.get("name");
                final usersItem = UsersCard(
                  userName: userName,
                );
                if (usersItem.userName != _signUser.email) {
                  usersListWidgets.add(usersItem);
                }
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: usersListWidgets,
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  PreferredSizeWidget _appBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Users"),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => pushToAndReplacement(
                  context: context, screenName: const WelcomeScreen())),
        ),
      );

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
}
