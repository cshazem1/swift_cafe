import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/text_field_components.dart';
import 'package:swift_cafe/components/text_field_password_components.dart';
import 'package:swift_cafe/cubits/firebase_sign_up_cubit/firebase_sign_up_cubit.dart';

import '../cubits/firebase_sign_up_cubit/firebase_lsign_up_state.dart';
import '../helper/show_snack_bar.dart';
import '../screens/home_screen.dart';
import 'Image.dart';
import 'custom_button.dart';

class CustomInfoUserSignUp extends StatefulWidget {
  const CustomInfoUserSignUp({super.key});

  @override
  State<CustomInfoUserSignUp> createState() => _CustomInfoUserSignUpState();
}

class _CustomInfoUserSignUpState extends State<CustomInfoUserSignUp> {
  String? name;
  String? email;
  String? pass;
  String? confPass;
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [

            const SizedBox(
              height: 35,
            ),
            const SizedBox(
              height: 60,
              width: 60,
              child: Image(
                image: AssetImage(
                  "image/coffee-cup.png",
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Swift',
              style: TextStyle(
                  color: Colors.white, fontSize: 45, fontFamily: 'YesevaOne'),
            ),
            const Text(
              'Cafe',
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontFamily: 'YesevaOne'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.6),
                    spreadRadius: 6,
                    blurRadius: 8,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: const Text("Latte but never late",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldComponent(
              enable: isLoading,
                onChange: (p0) {
                  name = p0;
                  print(name);
                },
                labelText: "User Name",
                hintText: "Enter your Name"),
            const SizedBox(
              height: 5,
            ),
            TextFieldComponent(
              enable: isLoading,
                onChange: (p0) {
                  email = p0;
                },
                labelText: "Email",
                hintText: "Enter your Email"),
            const SizedBox(
              height: 5,
            ),
            TextFieldPasswordComponents(
                onChange: (p0) {
                  pass = p0;
                },
                labelText: "Password",
                hintText: "Enter your Password"),
            TextFieldPasswordComponents(
                onChange: (p0) {
                  confPass = p0;
                },
                labelText: "confidentPassword ",
                hintText: "Enter your confidentPassword"),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                logInButton: false,
                buttonName: "Log In"),
            const SizedBox(height: 10),
            BlocBuilder<FirebaseSignUpCubit, FirebaseSignUpState>(
              builder: (context, state) {
                if (state is FirebaseLSignUpInitial) {
                  return CustomButton(
                      onPress: () async {
                        validate();
                        //  await      FireBase().signIn(email: email!, password: password!);
                      },
                      logInButton: true,
                      buttonName: "Log In=>");
                } else if (state is FirebaseLSignUpLoading) {
                  isLoading=false;
                  setState(() {

                  });
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FirebaseSignUpSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  );
                } else if (state is FirebaseSignUpFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) => showToast(
                      context,
                      state.message.contains("network error")
                          ? "Network Error"
                          : state.message.contains("incorrect")
                              ? "incorrect"
                              : state.message));
                  BlocProvider.of<FirebaseSignUpCubit>(context)
                      .emit(FirebaseLSignUpInitial());
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> validate() async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      await BlocProvider.of<FirebaseSignUpCubit>(context)
          .register(email: email!, password: pass!);
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
