import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordComponents extends StatefulWidget{
  String labelText;
  String hintText;
   TextFieldPasswordComponents({required this.labelText,required this.hintText});


  @override
  State<TextFieldPasswordComponents> createState() => _TextFieldPasswordComponentsState();
}

class _TextFieldPasswordComponentsState extends State<TextFieldPasswordComponents> {
  bool passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        obscureText: passwordInVisible,
        maxLength: 15,
        maxLines: 1,
        style: TextStyle(

            fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              //call this method when contact with screen is removed
              onPressed: () {
                setState(() {
                  passwordInVisible = !passwordInVisible;
                });
              },
              icon: Icon(
                passwordInVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 20,
              ),
            ),
            hintText: widget.hintText,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 10),
            label: Text(widget.labelText,
                style: (TextStyle(color: Colors.white,
                ))),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.orange))),
      ),
    );
  }
}