import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseCall{
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;


  Future<DocumentReference<Map<String, dynamic>>> addMassage(
      {required String text, required String sender,required String userId}) async {
    return await firestore.collection("users").doc(userId.toString()).collection('massages').add({
      'userId': sender,
      'massage': text,
      'time': FieldValue.serverTimestamp(),
    });
  }
  Future<DocumentReference<Map<String, dynamic>>> addUser(
      {required String userName}) async {
    return await firestore.collection("users").add({
      'name': userName,
      'time': FieldValue.serverTimestamp(),
    });
  }
}


