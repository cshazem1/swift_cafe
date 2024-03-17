import 'dart:ui';

import 'package:flutter/material.dart';

class SoppingBasketScreen extends StatelessWidget {
  static String id = "SoppingBasketScreen";
  const SoppingBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://w0.peakpx.com/wallpaper/116/592/HD-wallpaper-food-coffee-cinnamon-coffee-beans-cup-drink-still-life-viennoiserie-thumbnail.jpg"), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: const Offset(5, 6), // changes position of shadow
                    ),
                  ],
                ),
                child:  const Text("")),

          ),

        ],
      ),
    );
  }
}
