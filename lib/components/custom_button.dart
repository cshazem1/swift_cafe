import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/main.dart';
import 'package:swift_cafe/screans/home_screan.dart';

import '../cuibt/dtails_sign_cuibt/get_bool_click_sign_cubit.dart';
import 'bottom_bar.dart';

class ButtonComponents extends StatelessWidget{
  bool logInButton;
  String buttomName;
  ButtonComponents({required this.logInButton,required this.buttomName});


  @override
  Widget build(BuildContext context) {
    bool selectEnterLogin=  BlocProvider.of<GetBoolClickSignCubit>(context).login;
    bool selectEnterSignIn=  BlocProvider.of<GetBoolClickSignCubit>(context).signup;



    // TODO: implement build
    return   Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Container(

            child: ElevatedButton(

              onPressed: () {
                logInButton=BlocProvider.of<GetBoolClickSignCubit>(context).getBool(logInButton);

                if(logInButton&&selectEnterLogin&&!selectEnterSignIn)
              {
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BottomBar();
            },))   ;

              }
            else if(!logInButton&&selectEnterLogin&&selectEnterSignIn)
              {
                BlocProvider.of<GetBoolClickSignCubit>(context)
              .getBool(false);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("the registration is done"),
                ));
              }

            },
              child: Text(
                buttomName,
                style: TextStyle(

                    color: Colors.white),
              ),
              style: logInButton
                  ? ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.blue)
                  : ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.deepOrange.withOpacity(0),
                  foregroundColor: Colors.blue),

            ),
          ),
        ),
      ],
    )
    ;
  }
}
