import 'package:flutter/material.dart';

class MassageLineWidget extends StatelessWidget {
  final String massageSender;
  final String massageText;
  final bool isMe;

  const MassageLineWidget(
      {Key? key, required this.massageSender, required this.massageText,required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            massageSender,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          Material(
            elevation: 10,
              borderRadius:  BorderRadius.only(
                  bottomRight: isMe?const Radius.circular(10):const Radius.circular(0),
                  topLeft: const Radius.circular(10),
                  topRight:const  Radius.circular(10),
              bottomLeft: isMe?const Radius.circular(0):const Radius.circular(10)),
              color:isMe? Colors.blue[500]:Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  massageText,
                  style:  TextStyle(fontSize: 12, color:isMe? Colors.white:Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}
