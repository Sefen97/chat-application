import 'package:chat_application/ui/shere_widget/button_widget.dart';
import 'package:flutter/material.dart';

Future showOkAlert(
        {required BuildContext context,
        required String text,
        required Function() onTap}) =>
    showDialog(
        context: context,
        builder: (BuildContext context) => Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Text(
                            text,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                            buttonTitle: "Ok",
                            buttonTitleColor: Colors.white,
                            buttonTitleSize: 10,
                            buttonColor: Colors.blue,
                            onPressed: onTap,
                            width: MediaQuery.of(context).size.width / 3),
                      ],
                    ),
                  ),
                ),
              ),
            ));
