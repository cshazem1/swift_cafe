import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  String hintText;
  String labelText;
  TextFieldComponent({required this.hintText,required this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
        maxLength: 35,
        maxLines: 1,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 10),
            label: Text(labelText,
                style: (TextStyle(color: Colors.white))),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.orange))),
      ),
    );
  }
}
