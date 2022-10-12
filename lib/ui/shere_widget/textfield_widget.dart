import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final void Function(String) onChanged;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Color labelColor;
  final Color hintColor;
  final Color borderColor;
  final double hintFontSize;
  final double labelFontSize;

  const TextFieldWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.hintFontSize = 20,
    this.hintColor = Colors.indigo,
    this.labelColor = Colors.indigo,
    this.labelFontSize = 20,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.labelColor,
            fontSize: widget.labelFontSize,
          ),
          hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: widget.hintFontSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
