import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_cafe/models/categry_models.dart';

class SelectItemScreans extends StatelessWidget {
  CategryModels categryModels;
  SelectItemScreans(this.categryModels);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(children: [
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
                    color: Colors.grey.withOpacity(.8)),))),
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
                            Opacity: 1,
                            top: 5,
                            left: 20),
                        TextName(
                            textName: categryModels.rate.toString(),
                            fontSize: 20,
                            Opacity: 1,
                            top: 5,
                            left: 20),
                        TextName(
                            textName: categryModels.desc,
                            fontSize: 20,
                            Opacity: .6,
                            top: 5,
                            left: 20),
                        TextName(
                            textName: "Choice Of Cup Filling",
                            fontSize: 23,
                            Opacity: 1,
                            top: 10,
                            left: 20),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ElevatedButtonCustom(name: "Full"),
                            ),
                            ElevatedButtonCustom(name: "1/2 Full"),
                            ElevatedButtonCustom(name: "3/4 Full"),
                            ElevatedButtonCustom(name: "1/4 Full"),
                          ],
                        ),
                        TextName(
                            textName: "Choice Of Milk",
                            fontSize: 23,
                            Opacity: 1,
                            top: 15,
                            left: 20),
                        Row(
                          children: [
                            ButtonSwitch(textName: "Skin Milk"),
                            ButtonSwitch(textName: "Skin Milk"),

                          ],
                        ),
                        Row(
                          children: [
                            ButtonSwitch(textName: "Skin Milk"),
                            ButtonSwitch(textName: "Skin Milk"),

                          ],
                        ),
                        Row(
                          children: [
                            ButtonSwitch(textName: "Skin Milk"),


                          ],

                        ),
                        TextName(
                            textName: "Choice Of Cup Filling",
                            fontSize: 23,
                            Opacity: 1,
                            top: 10,
                            left: 20),
                    Row(
                      children: [
                        ButtonSwitch(textName: "Skin Milk"),
                        ButtonSwitch(textName: "Skin Milk"),

                      ],),
                        Row(
                          children: [
                            ButtonSwitch(textName: "Skin Milk"),
                            ButtonSwitch(textName: "Skin Milk"),

                          ],),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(color: Colors.black45
                            ,borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
    CheckBoxCustom(),
TextName(textName: "High Priority☻", fontSize: 13, Opacity: 1),
ElevatedButton(onPressed:(){}, child: TextName(textName: "Submit ",fontSize: 13,Opacity: 1,),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)

                            ],),
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

class CheckBoxCustom extends StatefulWidget {

   CheckBoxCustom({
    super.key,
  });

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom> {
  bool on=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      color: Colors.white,
      child: Checkbox(
        checkColor: Colors.yellowAccent,activeColor:Colors.orange,hoverColor: Colors.lightGreen,value: this.on,onChanged: (value) {
        return setState(() {
          this.on=value!;
        });
      },),
    );
        }
}

class ButtonSwitch extends StatefulWidget {
   ButtonSwitch({required this.textName
  });
String textName;

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,top: 10),
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
          TextName(textName: widget.textName, fontSize: 13, Opacity: .8)
        ],
      ),
    );
  }
}

class ElevatedButtonCustom extends StatefulWidget {
  String name;

  ElevatedButtonCustom({required this.name});

  @override
  State<ElevatedButtonCustom> createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 10),
      child: ElevatedButton(
        onPressed: () {
          click = !click;
          setState(() {});
        },
        child: TextName(
            Opacity: .8,
            fontSize: 15,
            textName: widget.name,
            colors: click ? Colors.white : Colors.black),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(80, 30),
            backgroundColor: click ? Colors.green : Colors.white),
      ),
    );
  }
}

class TextName extends StatelessWidget {
   String textName;
   double fontSize;
   double Opacity;
  Color? colors;
  double? top;
  double? left;
  TextName(
      {required this.textName,
      required this.fontSize,
      required this.Opacity,
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
            color: colors?.withOpacity(Opacity)?? Colors.white.withOpacity(Opacity)),
      ),
    );
  }
}
