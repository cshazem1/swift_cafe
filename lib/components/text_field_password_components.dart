import 'package:flutter/material.dart';

class TextFieldPasswordComponents extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(String) onChange;
  final bool enable;
  const TextFieldPasswordComponents(
      {super.key, required this.labelText, required this.hintText,required this.onChange, required this.enable});

  @override
  State<TextFieldPasswordComponents> createState() =>
      _TextFieldPasswordComponentsState();
}

class _TextFieldPasswordComponentsState
    extends State<TextFieldPasswordComponents> {
  bool passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        enabled:widget.enable ,
        onChanged: widget.onChange,
        validator: (value) {
          if(value!.isEmpty) {
            return "password required";
          }
          else {
            return null;
          }
        },
        obscureText: passwordInVisible,
        maxLength: 15,
        maxLines: 1,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              //call this method when contact with screen is removed
              onPressed: () {
                setState(() {
                  passwordInVisible = !passwordInVisible;
                });
              },
              icon: Icon(
                passwordInVisible ? Icons.visibility_off : Icons.visibility,
                size: 20,
              ),
            ),
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            label: Text(widget.labelText,
                style: (const TextStyle(
                  color: Colors.white,
                ))),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange))),
      ),
    );
  }
}
