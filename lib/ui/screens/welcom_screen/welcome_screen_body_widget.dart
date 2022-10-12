import 'package:chat_application/shere_functions/push_to.dart';
import 'package:chat_application/ui/screens/rejester_screen/register_screen.dart';
import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreenBodyWidget extends StatefulWidget {
  const WelcomeScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenBodyWidget> createState() =>
      _WelcomeScreenBodyWidgetState();
}

class _WelcomeScreenBodyWidgetState extends State<WelcomeScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
            buttonTitle: "Sign In",
            onPressed: () {},
            buttonColor: Colors.yellow[900]!,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            buttonTitle: "Sign Up",
            onPressed: () =>
                pushTo(context: context, screenName: const RegisterScreen()),
            buttonColor: Colors.blue[900]!,
          ),
        ],
      ),
    );
  }
}
