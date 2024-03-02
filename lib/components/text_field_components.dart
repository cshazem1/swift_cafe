import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final String labelText;
 final Function(String) onChange;
final bool enable;
  const TextFieldComponent(
      {super.key, required this.hintText, required this.labelText,required this.onChange,required this.enable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        enabled:enable ,
        validator: (value) {
          if(value!.isEmpty){
            return "it is empty";
          }
          else {
            return null;
          }
        },

        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLength: 35,
        maxLines: 1,
        onChanged: onChange,
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
