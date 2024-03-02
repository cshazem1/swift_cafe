
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  bool logInButton;
  String buttonName;

  VoidCallback onPress;
   CustomButton({super.key, required this.logInButton, required this.buttonName,required this.onPress});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: onPress,
            style: logInButton
                ? ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.blue)
                : ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange.withOpacity(0),
                    foregroundColor: Colors.blue),
            child: Text(
              buttonName,
              style:  const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
