import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
 final String imageUrl;
 const  Background({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(.0),
              ),
            )));
  }
}
