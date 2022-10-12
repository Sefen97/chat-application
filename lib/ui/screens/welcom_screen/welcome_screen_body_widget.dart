import 'package:chat_application/ui/shere_widget/custom_button.dart';
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
          CustomButtonWidget(
            buttonTitle: "Sign In",
            onPressed: () {},
            buttonColor: Colors.yellow[900]!,
          ),
          const SizedBox(height: 20,),
          CustomButtonWidget(
            buttonTitle: "Sign Up",
            onPressed: () {},
            buttonColor: Colors.blue[900]!,
          ),
        ],
      ),
    );
  }
}
