import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String buttonTitle;
  final double buttonTitleSize;
  final double? width;
  final Color buttonTitleColor;
  final Color buttonColor;

  const CustomButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.buttonTitleColor = Colors.white,
    this.buttonTitleSize = 20,
    this.buttonColor = Colors.blueAccent,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
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
