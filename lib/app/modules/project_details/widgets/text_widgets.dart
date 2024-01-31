import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.normal))
        ]));
  }
}
