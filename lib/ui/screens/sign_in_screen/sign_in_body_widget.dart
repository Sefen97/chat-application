import 'package:chat_application/shere_functions/push_to.dart';
import 'package:chat_application/ui/screens/chat_screen/chat_screen.dart';
import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:chat_application/ui/shere_widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../shere_functions/ok_alert.dart';
import '../../../shere_functions/show_loader.dart';

class SignInScreenBodyWidget extends StatefulWidget {
  const SignInScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<SignInScreenBodyWidget> createState() => _SignInScreenBodyWidgetState();
}

class _SignInScreenBodyWidgetState extends State<SignInScreenBodyWidget> {
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
                    labelText: "Enter Your  Username",
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
                    hintText: " Password",
                    labelText: "Enter Your Password",
                    borderColor: Colors.orange,
                    hintColor: Colors.black,
                    hintFontSize: 15,
                    labelColor: Colors.black,
                    labelFontSize: 15),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                    buttonTitle: "Sign in",
                    onPressed: () => loginFunction()),
              ]),
        ),

    );
  }
  Future loginFunction() async {
    if (userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        showLoader(context);
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userNameController.text.trim(), password: passwordController.text.trim());
        if (FirebaseAuth.instance.currentUser != null) {
          pop(context: context);
          pushToAndReplacement(context: context, screenName: const ChatScreen());
        }else{
          pop(context: context);
          showOkAlert(
              context: context,
              text: "username or password unCorrect",
              onTap: () =>pop(context: context));
        }
      } on FirebaseAuthException catch (e) {
        pop(context: context);
        showOkAlert(
            context: context,
            text: "The username or password is invalid ",
            onTap: () {
              pop(context: context);
            });

        if (e.code == 'user-not-found') {
          pop(context: context);
          showOkAlert(context: context, text: "No user found for that email", onTap: (){
            pop(context: context);
          });
        } else if (e.code == 'wrong-password') {
          pop(context: context);
          showOkAlert(context: context, text: "Wrong password provided for that user", onTap: (){
            pop(context: context);
          });
        }
      }
    }else{
      showOkAlert(context: context, text: "Please enter user name and password", onTap: (){
        pop(context: context);
      });
    }
  }
}
