import 'dart:async';

import 'package:chat_application/network/firemase_call/firebase_call.dart';
import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:chat_application/ui/shere_widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../shere_functions/push_to.dart';
import '../../../shere_functions/show_loader.dart';
import '../../../shere_functions/ok_alert.dart';
import '../users_screen/users_screen.dart';

class RegisterScreenBodyWidget extends StatefulWidget {
  const RegisterScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegisterScreenBodyWidget> createState() =>
      _RegisterScreenBodyWidgetState();
}

class _RegisterScreenBodyWidgetState extends State<RegisterScreenBodyWidget> {
  late UserCredential userCredential;
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.network(
                  "https://img.freepik.com/premium-vector/chatting-design-concept-with-hand-holding-cellphone_7087-798.jpg?w=2000"),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  onChanged: (value) {},
                  controller: userNameController,
                  hintText: "Username",
                  labelText: "Username",
                  borderColor: Colors.orange,
                  hintColor: Colors.black,
                  hintFontSize: 15,
                  labelColor: Colors.black,
                  labelFontSize: 15),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  onChanged: (value) {},
                  controller: passwordController,
                  hintText: "Password",
                  labelText: "Password",
                  borderColor: Colors.orange,
                  hintColor: Colors.black,
                  hintFontSize: 15,
                  labelColor: Colors.black,
                  labelFontSize: 15),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                  buttonColor: Colors.orange,
                  buttonTitle: "Register",
                  onPressed: () => _registerMethod()),
            ]),),
    );
  }


  Future _registerMethod() async {
      if(userNameController.text.isNotEmpty&&passwordController.text.isNotEmpty){
        try {
          showLoader(context);
          userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userNameController.text.trim(),
            password: passwordController.text.trim(),
          );
          if (userCredential.additionalUserInfo!.isNewUser) {
          FireBaseCall().addUser(userName: userCredential.user!.email.toString());
            showOkAlert(
                context: context,
                text: "Sign up success",
                onTap: () {
                  pop(context: context);
                  pushToAndReplacement(context: context, screenName: const UsersScreen());
                });
          }else{
            pop(context: context);
            showOkAlert(
                context: context,
                text: "The account already exists for that email !,"
                    "please try another email",
                onTap: () =>pop(context: context));
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            pop(context: context);
            showOkAlert(
                context: context,
                text: "The password is weak",
                onTap: () =>pop(context: context));
          } else if (e.code == 'email-already-in-use') {
            pop(context: context);
            showOkAlert(
                context: context,
                text: "The account already exists for that email !,"
                    "please try another email",
                onTap: () =>pop(context: context));
          }
        } catch (e) {
          pop(context: context);
          showOkAlert(
              context: context,
              text: "There is something wrong ",
              onTap: ()=>  pop(context: context));
        }
      }else{
        showOkAlert(
            context: context,
            text: "Please enter user name and password",
            onTap: ()=>
              pop(context: context));
      }


  }
}
