import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseCall{
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;


  Future<DocumentReference<Map<String, dynamic>>> addMassage(
      {required String text, required String sender}) async {
    return await firestore.collection("massages").add({
      'sender': sender,
      'textMassage': text,
      'time': FieldValue.serverTimestamp(),
    });
  }


}


