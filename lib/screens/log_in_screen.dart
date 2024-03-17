import 'package:flutter/material.dart';

import '../components/background.dart';
import '../components/custom_info_user_log_in.dart';

class LogInScreen extends StatelessWidget {

  const LogInScreen({super.key});
  static String id = "login";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
      children: [
         Background(imageUrl: "image/cafe_background.webp"),
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
              child:  const CustomInfoUserLogIn()),

        ),
      ],
    ));
  }
}

