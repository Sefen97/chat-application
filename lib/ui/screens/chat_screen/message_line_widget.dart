import 'package:flutter/material.dart';

class MassageLineWidget extends StatelessWidget {
  final String massageSender;
  final String massageText;
  final bool isMe;

  const MassageLineWidget(
      {Key? key,
      required this.massageSender,
      required this.massageText,
      required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: isMe ? MediaQuery.of(context).size.width / 3 : 0,
                right: isMe ? 0 : MediaQuery.of(context).size.width / 3),
            child: Material(
                elevation: 2,
                borderRadius: BorderRadius.only(
                    bottomRight: isMe
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(10)),
                color: isMe ? Colors.orange[500] : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    massageText,
                    style: TextStyle(
                        fontSize: 14,
                        color: isMe ? Colors.white : Colors.black),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
