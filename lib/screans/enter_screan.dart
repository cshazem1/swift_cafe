import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/cuibt/dtails_sign_cuibt/get_bool_click_sign_cubit.dart';
import 'package:swift_cafe/cuibt/dtails_sign_cuibt/get_bool_click_states.dart';
import 'package:swift_cafe/screans/sign_up_screan.dart';
import '../components/custom_button.dart';
import 'log_in_screan.dart';

class EnterScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        body:
        Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'image/cofebackground.webp'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(.0),
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
                    offset: Offset(5, 6), // changes position of shadow
                  ),
                ],
              ),
             child:  BlocProvider(

                    create: (context) => GetBoolClickSignCubit(),
                    child:  BlocBuilder<GetBoolClickSignCubit, GetBoolClickButtonStates>(
                      builder: (context, state) {
                    return ListView( children: [
                     state is GetBoolLoginStates?
                      LogInScrean():SignUpScrean()

                      ,
                      SizedBox(
                        height: 30,
                      ),
                      ButtonComponents(

                          logInButton:
                          BlocProvider.of<GetBoolClickSignCubit>(context)
                              .logInButton,buttomName: "Log In"),
                      SizedBox(height: 10),
                      ButtonComponents(
                          logInButton:
                          !BlocProvider.of<GetBoolClickSignCubit>(context)
                              .logInButton,buttomName: "Sign Up"),
                    ],);


                      },
                                    ),



                  )
                ),
        ),

      ],
    ));
  }
}
