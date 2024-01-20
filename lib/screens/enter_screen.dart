import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/screens/sign_up_screen.dart';
import '../components/custom_button.dart';
import '../cuibt/details_sign_cuibt/get_bool_click_sign_cubit.dart';
import '../cuibt/details_sign_cuibt/get_bool_click_states.dart';
import 'log_in_screen.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

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
                image: AssetImage(
                    'image/cafe_background.webp'), // Replace with your image path
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
                    offset: const Offset(5, 6), // changes position of shadow
                  ),
                ],
              ),
              child: BlocProvider(
                create: (context) => GetBoolClickSignCubit(),
                child: BlocBuilder<GetBoolClickSignCubit,
                    GetBoolClickButtonStates>(
                  builder: (context, state) {
                    return ListView(
                      children: [
                        state is GetBoolLoginStates
                            ? const LogInScreen()
                            : const SignUpScreen(),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonComponents(
                            logInButton:
                                BlocProvider.of<GetBoolClickSignCubit>(context)
                                    .logInButton,
                            buttonName: "Log In"),
                        const SizedBox(height: 10),
                        ButtonComponents(
                            logInButton:
                                !BlocProvider.of<GetBoolClickSignCubit>(context)
                                    .logInButton,
                            buttonName: "Sign Up"),
                      ],
                    );
                  },
                ),
              )),
        ),
      ],
    ));
  }
}
