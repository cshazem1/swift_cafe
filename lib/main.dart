import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swift_cafe/screans/enter_screan.dart';
import 'package:swift_cafe/screans/home_screan.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  @override
  Widget build(BuildContext context) {

    return Builder(
      builder: (context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,

            ),
            home: EnterScrean());
      }
    );
  }
}

