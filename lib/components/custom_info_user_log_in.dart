import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/text_field_components.dart';
import 'package:swift_cafe/components/text_field_password_components.dart';
import 'package:swift_cafe/screens/home_screen.dart';
import 'package:swift_cafe/screens/sign_up_screen.dart';

import '../cubits/firebase_log_in_cubit/firebase_log_in_cubit.dart';
import '../cubits/firebase_log_in_cubit/firebase_log_in_state.dart';
import '../helper/show_snack_bar.dart';
import 'custom_button.dart';

class CustomInfoUserLogIn extends StatefulWidget {
  const CustomInfoUserLogIn({super.key});

  @override
  State<CustomInfoUserLogIn> createState() => _CustomInfoUserLogInState();
}

class _CustomInfoUserLogInState extends State<CustomInfoUserLogIn> {
  String? email;
  String? password;
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          child: Form(
            autovalidateMode: autoValidateMode,
            key: globalKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 65,
                  width: 65,
                  child: Image(
                    image: AssetImage(
                      "image/coffee-cup.png",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Swift',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'YesevaOne'),
                ),
                const Text(
                  'Cafe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'YesevaOne'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(.6),
                        spreadRadius: 6,
                        blurRadius: 8,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Text("Latte but never late",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldComponent(
                    enable: isLoading,
                    onChange: (p0) {
                      email = p0;
                    },
                    labelText: "User Name",
                    hintText: "Enter your Name"),
                const SizedBox(
                  height: 5,
                ),
                TextFieldPasswordComponents(
                    onChange: (p0) {
                      password = p0;
                    },
                    labelText: "Password",
                    hintText: "Enter your Password"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<FirebaseLogInCubit, FirebaseLogInState>(
          builder: (context, state) {
            if (state is FirebaseLogInInitial) {
              return CustomButton(
                  onPress: () async {
                    validate();
                    //  await      FireBase().signIn(email: email!, password: password!);
                  },
                  logInButton: true,
                  buttonName: "Log In=>");
            } else if (state is FirebaseLogInLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FirebaseLogInSuccess) {
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              );
            } else if (state is FirebaseLogInFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) => showToast(
                  context,
                  state.message.contains("network error")
                      ? "Network Error"
                      : state.message.contains("incorrect")
                          ? "incorrect"
                          : state.message));

            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 10),
        CustomButton(
            onPress: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
            logInButton: false,
            buttonName: "Sign Up"),
      ],
    );
  }

  Future<void> validate() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      await BlocProvider.of<FirebaseLogInCubit>(context)
          .signIn(email: email!, password: password!);
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
