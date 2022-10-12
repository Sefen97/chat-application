import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String buttonTitle;
  final double buttonTitleSize;
  final double? width;
  final Color buttonTitleColor;
  final Color buttonColor;

  const ButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.buttonTitleColor = Colors.white,
    this.buttonTitleSize = 20,
    this.buttonColor = Colors.indigo,
    this.width,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: widget.buttonColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: SizedBox(
          width: widget.width ?? MediaQuery.of(context).size.width,
          child: MaterialButton(
            onPressed: widget.onPressed,
            child: Text(widget.buttonTitle,
                style: TextStyle(
                    fontSize: widget.buttonTitleSize,
                    color: widget.buttonTitleColor)),
          ),
        ));
  }
}
