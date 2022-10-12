import 'package:chat_application/shere_functions/push_to.dart';
import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:chat_application/ui/shere_widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreenBodyWidget extends StatefulWidget {
  const RegisterScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegisterScreenBodyWidget> createState() =>
      _RegisterScreenBodyWidgetState();
}

class _RegisterScreenBodyWidgetState extends State<RegisterScreenBodyWidget> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                  onChanged: (value) {},
                  controller: userNameController,
                  hintText: "Username",
                  labelText: "Username",
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
                  hintText: "Password",
                  labelText: "Password",
                  borderColor: Colors.yellow,
                  hintColor: Colors.black,
                  hintFontSize: 15,
                  labelColor: Colors.black,
                  labelFontSize: 15),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                  buttonTitle: "Register",
                  onPressed: () => pop(context: context)),
            ]),
      ),
    );
  }
}
