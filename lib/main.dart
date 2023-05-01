import 'package:chat_application/ui/screens/chat_screen/chat_screen.dart';
import 'package:chat_application/ui/screens/welcom_screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: auth.currentUser == null ? const WelcomeScreen() : const ChatScreen(),
  ));
}
