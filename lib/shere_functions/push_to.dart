import 'package:flutter/material.dart';

Future pushTo({required BuildContext context, required Widget screenName}) {
  return Navigator.push(context, MaterialPageRoute(builder: (_) => screenName));
}

void pop({required BuildContext context}) {
  return Navigator.pop(context);
}

void callBack({required BuildContext context, dynamic callBackValue}) {
  return Navigator.pop(context, callBackValue);
}
Future pushToAndReplacement({required BuildContext context, required Widget screenName}) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screenName));
}