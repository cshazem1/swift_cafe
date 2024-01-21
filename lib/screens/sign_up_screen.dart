import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/text_field_components.dart';
import '../components/text_field_password_components.dart';
import '../cuibt/details_sign_cuibt/get_bool_click_sign_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    signInConditionShow(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(
                "image/coffee-cup.png",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
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
            height: 10,
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
                    fontSize: 12)),
          ),
          const SizedBox(
            height: 27,
          ),
          const TextFieldComponent(
              labelText: "Name", hintText: "Enter your Name"),
          const SizedBox(
            height: 5,
          ),
          const TextFieldComponent(
              labelText: "Email", hintText: "Enter your Email"),
          const SizedBox(
            height: 5,
          ),
          const TextFieldPasswordComponents(
              labelText: "Password", hintText: "Enter your Password"),
          const SizedBox(
            height: 5,
          ),
          const TextFieldPasswordComponents(
              labelText: "Confirm Password", hintText: "Confirm Password"),
        ],
      ),
    );
  }

  void signInConditionShow(BuildContext context) {
    if (BlocProvider.of<GetBoolClickSignCubit>(context).logInButton &
        BlocProvider.of<GetBoolClickSignCubit>(context).login) {
      BlocProvider.of<GetBoolClickSignCubit>(context).login = false;

      BlocProvider.of<GetBoolClickSignCubit>(context).signup = false;
    } else {
      BlocProvider.of<GetBoolClickSignCubit>(context).signup = true;
    }
  }
}
