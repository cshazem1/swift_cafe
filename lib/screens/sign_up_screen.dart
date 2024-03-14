import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/background.dart';
import 'package:swift_cafe/components/custom_info_user_sign_up.dart';
import 'package:swift_cafe/cubits/firebase_sign_up_cubit/firebase_sign_up_cubit.dart';



class SignUpScreen extends StatelessWidget {

  static String id = "signup";

  const SignUpScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseSignUpCubit(),

      child: Scaffold(
          body: Stack(
            children: [
              const Background(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 50),
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
                        offset: const Offset(
                            5, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const CustomInfoUserSignUp(),

                ),)
            ],
          )),
    );
  }

}