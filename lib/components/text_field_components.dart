import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final String labelText;

  const TextFieldComponent(
      {super.key, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLength: 35,
        maxLines: 1,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            label:
                Text(labelText, style: (const TextStyle(color: Colors.white))),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange))),
      ),
    );
  }
}
