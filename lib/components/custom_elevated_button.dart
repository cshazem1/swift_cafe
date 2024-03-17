import 'package:flutter/material.dart';
import 'package:swift_cafe/public.dart';

import 'custom_text_name.dart';

class ElevatedButtonCustom extends StatefulWidget {
  final String name;
  final int num;
  final VoidCallback click;

  const ElevatedButtonCustom(
      {super.key, required this.name, required this.num, required this.click});

  @override
  State<ElevatedButtonCustom> createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: ElevatedButton(
        onPressed: widget.click,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(80, 30),
            backgroundColor:
            choiceFilling == widget.name ? Colors.green : Colors.white),
        child: TextName(
            textOpacity: .8,
            fontSize: 15,
            textName: widget.name,
            colors: choiceFilling == widget.name ? Colors.white : Colors.black),
      ),
    );
  }
}