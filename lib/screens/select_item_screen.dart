import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_cafe/models/categry_models.dart';

@immutable
class SelectItemScreen extends StatelessWidget {
  final CategryModels categryModels;
  const SelectItemScreen(this.categryModels, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.xesubJn0DWYf6t60IW0FdQHaD5?rs=1&pid=ImgDetMain"), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ))),
        Positioned(
            top: 300,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(.8)),
                ))),
        Positioned(
          top: 300,
          child: SizedBox(
            height: 500,
            width: 400,
            child: ListView(
              children: [
                TextName(
                    textName: categryModels.name,
                    fontSize: 30,
                    textOpacity: 1,
                    top: 5,
                    left: 20),
                TextName(
                    textName: categryModels.rate.toString(),
                    fontSize: 20,
                    textOpacity: 1,
                    top: 5,
                    left: 20),
                TextName(
                    textName: categryModels.desc,
                    fontSize: 20,
                    textOpacity: .6,
                    top: 5,
                    left: 20),
                const TextName(
                    textName: "Choice Of Cup Filling",
                    fontSize: 23,
                    textOpacity: 1,
                    top: 10,
                    left: 20),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButtonCustom(name: "Full"),
                    ),
                    ElevatedButtonCustom(name: "1/2 Full"),
                    ElevatedButtonCustom(name: "3/4 Full"),
                    ElevatedButtonCustom(name: "1/4 Full"),
                  ],
                ),
                const TextName(
                    textName: "Choice Of Milk",
                    fontSize: 23,
                    textOpacity: 1,
                    top: 15,
                    left: 20),
                const Row(
                  children: [
                    ButtonSwitch(textName: "Skin Milk"),
                    ButtonSwitch(textName: "Skin Milk"),
                  ],
                ),
                const Row(
                  children: [
                    ButtonSwitch(textName: "Skin Milk"),
                    ButtonSwitch(textName: "Skin Milk"),
                  ],
                ),
                const Row(
                  children: [
                    ButtonSwitch(textName: "Skin Milk"),
                  ],
                ),
                const TextName(
                    textName: "Choice Of Cup Filling",
                    fontSize: 23,
                    textOpacity: 1,
                    top: 10,
                    left: 20),
                const Row(
                  children: [
                    ButtonSwitch(textName: "Skin Milk"),
                    ButtonSwitch(textName: "Skin Milk"),
                  ],
                ),
                const Row(
                  children: [
                    ButtonSwitch(textName: "Skin Milk"),
                    ButtonSwitch(textName: "Skin Milk"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CheckBoxCustom(),
                        const TextName(
                            textName: "High Priority☻",
                            fontSize: 13,
                            textOpacity: 1),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const TextName(
                            textName: "Submit ",
                            fontSize: 13,
                            textOpacity: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: SizedBox(
              height: 300,
              width: 400,
              child: Image(
                image: NetworkImage(categryModels.image),
              )),
        ),
      ]),
    );
  }
}

@immutable
class CheckBoxCustom extends StatefulWidget {
  const CheckBoxCustom({
    super.key,
  });

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  late bool on = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      color: Colors.white,
      child: Checkbox(
        checkColor: Colors.yellowAccent,
        activeColor: Colors.orange,
        hoverColor: Colors.lightGreen,
        value: on,
        onChanged: (value) {
          return setState(() {
            on = value!;
          });
        },
      ),
    );
  }
}

class ButtonSwitch extends StatefulWidget {
  const ButtonSwitch({super.key, required this.textName});
  final String textName;

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 10),
      child: Row(
        children: [
          CupertinoSwitch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          TextName(textName: widget.textName, fontSize: 13, textOpacity: .8)
        ],
      ),
    );
  }
}

@immutable
class ElevatedButtonCustom extends StatefulWidget {
  final String name;

  const ElevatedButtonCustom({super.key, required this.name});

  @override
  State<ElevatedButtonCustom> createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: ElevatedButton(
        onPressed: () {
          click = !click;
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(80, 30),
            backgroundColor: click ? Colors.green : Colors.white),
        child: TextName(
            textOpacity: .8,
            fontSize: 15,
            textName: widget.name,
            colors: click ? Colors.white : Colors.black),
      ),
    );
  }
}

@immutable
class TextName extends StatelessWidget {
  final String textName;
  final double fontSize;
  final double textOpacity;
  final Color? colors;
  final double? top;
  final double? left;
  const TextName(
      {super.key,
      required this.textName,
      required this.fontSize,
      required this.textOpacity,
      this.top,
      this.left,
      this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 0, left: left ?? 0),
      child: Text(
        textName,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: "YesevaOne",
            color: colors?.withOpacity(textOpacity) ??
                Colors.white.withOpacity(textOpacity)),
      ),
    );
  }
}
