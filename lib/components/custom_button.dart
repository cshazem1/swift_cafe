import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cuibt/details_sign_cuibt/get_bool_click_sign_cubit.dart';
import 'bottom_bar.dart';

// ignore: must_be_immutable
class ButtonComponents extends StatelessWidget {
  bool logInButton;
  String buttonName;
   ButtonComponents({super.key, required this.logInButton, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    bool selectEnterLogin =
        BlocProvider.of<GetBoolClickSignCubit>(context).login;
    bool selectEnterSignIn =
        BlocProvider.of<GetBoolClickSignCubit>(context).signup;
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              logInButton = BlocProvider.of<GetBoolClickSignCubit>(context)
                  .getBool(logInButton);

              if (logInButton && selectEnterLogin && !selectEnterSignIn) {
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const BottomBar();
                  },
                ));
              } else if (!logInButton &&
                  selectEnterLogin &&
                  selectEnterSignIn) {
                BlocProvider.of<GetBoolClickSignCubit>(context)
                    .getBool(false);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("the registration is done"),
                ));
              }
            },
            style: logInButton
                ? ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.blue)
                : ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange.withOpacity(0),
                    foregroundColor: Colors.blue),
            child: Text(
              buttonName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
