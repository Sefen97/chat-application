import 'package:flutter/material.dart';

void showLoader(context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()));