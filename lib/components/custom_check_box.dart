import 'package:flutter/material.dart';

class CheckBoxCustom extends StatefulWidget {
  const CheckBoxCustom({
    super.key,
  });

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  late bool on = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      color: Colors.white,
      child: Checkbox(
        checkColor: Colors.yellowAccent,
        activeColor: Colors.orange,
        hoverColor: Colors.lightGreen,
        value: on,
        onChanged: (value) {
          return setState(() {
            on = value!;
          });
        },
      ),
    );
  }
}
