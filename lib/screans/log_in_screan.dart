import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/screans/home_screan.dart';

import '../components/custom_button.dart';
import '../components/text_field_components.dart';
import '../components/text_field_password_components.dart';
import '../cuibt/dtails_sign_cuibt/get_bool_click_sign_cubit.dart';

class LogInScrean extends StatelessWidget {
  const LogInScrean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    logInConditionShow(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 65,
            width: 65,
            child: Image(
              image: AssetImage(
                "image/coffee-cup.png",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Swift',
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontFamily: 'YesevaOne'),
          ),
          Text(
            'Cafe',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontFamily: 'YesevaOne'),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("Latte but never late",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(.6),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFieldComponent(
              labelText: "User Name", hintText: "Enter your Name"),
          SizedBox(
            height: 5,
          ),
          TextFieldPasswordComponents(
              labelText: "Password", hintText: "Enter your Password"),
        ],
      ),
    );
  }

  void logInConditionShow(BuildContext context) {
    if (BlocProvider.of<GetBoolClickSignCubit>(context).login) {
      BlocProvider.of<GetBoolClickSignCubit>(context).signup = false;
    } else {
      BlocProvider.of<GetBoolClickSignCubit>(context).login = true;
    }
  }
}
