import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_cafe/public.dart';

import 'custom_text_name.dart';

class ButtonSwitch extends StatefulWidget {
  final int num;
  final Function(bool) click;
  const ButtonSwitch(
      {super.key,
        required this.textName,
        required this.num,
        required this.click});
  final String textName;

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 10),
      child: Row(
        children: [
          CupertinoSwitch(
            value:
            choiceMilk == widget.textName || choiceSugar == widget.textName,
            onChanged: widget.click,
          ),
          TextName(textName: widget.textName, fontSize: 13, textOpacity: .8)
        ],
      ),
    );
  }
}