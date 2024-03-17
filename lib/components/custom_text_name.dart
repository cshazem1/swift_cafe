import 'package:flutter/material.dart';

class TextName extends StatelessWidget {
  final String textName;
  final double fontSize;
  final double textOpacity;
  final Color? colors;
  final double? top;
  final FontWeight? fontWeight;
  final double? left;
  const TextName(
      {super.key,
        required this.textName,
        required this.fontSize,
        required this.textOpacity,
        this.top,
        this.left,
        this.colors, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 0, left: left ?? 0),
      child: Text(
        textName,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: "YesevaOne",
            color: colors?.withOpacity(textOpacity) ??
                Colors.white.withOpacity(textOpacity)),
      ),
    );
  }
}
