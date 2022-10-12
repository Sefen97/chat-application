import 'package:chat_application/shere_functions/push_to.dart';
import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:chat_application/ui/shere_widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignInScreenBodyWidget extends StatefulWidget {
  const SignInScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<SignInScreenBodyWidget> createState() => _SignInScreenBodyWidgetState();
}

class _SignInScreenBodyWidgetState extends State<SignInScreenBodyWidget> {
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
                    borderColor: Colors.yellow,
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
                    borderColor: Colors.yellow,
                    hintColor: Colors.black,
                    hintFontSize: 15,
                    labelColor: Colors.black,
                    labelFontSize: 15),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                    buttonTitle: "Sign in",
                    onPressed: () => pop(context: context)),
              ]),
        ),

    );
  }
}
