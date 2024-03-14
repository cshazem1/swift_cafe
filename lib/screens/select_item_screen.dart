import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/cubits/user_data_cubit/user_data_cubite.dart';
import 'package:swift_cafe/cubits/user_data_cubit/user_data_state.dart';
import 'package:swift_cafe/models/categry_models.dart';
import 'package:swift_cafe/models/user_model.dart';

import '../firebase/cloud_storage/order.dart';

String choiceFilling = "";
String choiceMilk = "";
String choiceSugar = "";

@immutable
class SelectItemScreen extends StatefulWidget {
  final CategryModels categryModels;
  const SelectItemScreen(this.categryModels, {super.key});

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends State<SelectItemScreen> {
  void toggleSelectionFilling(String buttonName) {
    setState(() {
      if (choiceFilling == buttonName) {
        // If the same button is clicked, unselect it
        choiceFilling = "";
      } else {
        // Otherwise, select the clicked button
        choiceFilling = buttonName;
      }
    });
  }

  void toggleSelectionSugar(String buttonName) {
    setState(() {
      if (choiceSugar == buttonName) {
        // If the same button is clicked, unselect it
        choiceSugar = "";
      } else {
        // Otherwise, select the clicked button
        choiceSugar = buttonName;
      }
    });
  }

  void toggleSelectionMilk(String buttonName) {
    setState(() {
      if (choiceMilk == buttonName) {
        // If the same button is clicked, unselect it
        choiceMilk = "";
      } else {
        // Otherwise, select the clicked button
        choiceMilk = buttonName;
      }
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
    ];
    return menuItems;
  }

  String value = "1";
  double? totalSalary;
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    totalSalary = double.parse(widget.categryModels.salary);
    double dValue = double.parse(value);
    totalSalary = totalSalary! * dValue;

    print(choiceSugar);
    print(choiceFilling);
    print(value);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextName(
                        textName: widget.categryModels.name,
                        fontSize: 30,
                        textOpacity: 1,
                        top: 5,
                        left: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: DropdownButton(
                        autofocus: true,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        dropdownColor: Colors.grey,
                        iconEnabledColor: Colors.grey,
                        value: value,
                        items: dropdownItems,
                        onChanged: (String? x) {
                          value = x!;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
                TextName(
                    textName: totalSalary.toString(),
                    fontSize: 20,
                    textOpacity: 1,
                    top: 5,
                    left: 20),
                TextName(
                    textName: widget.categryModels.desc,
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButtonCustom(
                        name: "Full",
                        num: 1,
                        click: () => toggleSelectionFilling("Full"),
                      ),
                    ),
                    ElevatedButtonCustom(
                      name: "1/2 Full",
                      num: 2,
                      click: () => toggleSelectionFilling("1/2 Full"),
                    ),
                    ElevatedButtonCustom(
                      name: "3/4 Full",
                      num: 3,
                      click: () => toggleSelectionFilling("3/4 Full"),
                    ),
                    ElevatedButtonCustom(
                      name: "1/4 Full",
                      num: 4,
                      click: () => toggleSelectionFilling("1/4 Full"),
                    ),
                  ],
                ),
                const TextName(
                    textName: "Choice Of Milk",
                    fontSize: 23,
                    textOpacity: 1,
                    top: 15,
                    left: 20),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "Skin Milk",
                      num: 1,
                      click: (b) => toggleSelectionMilk("Skin Milk"),
                    ),
                    ButtonSwitch(
                      textName: "Full Cream Milk",
                      num: 2,
                      click: (b) => toggleSelectionMilk("Full Cream Milk"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "Almond Milk",
                      num: 3,
                      click: (b) => toggleSelectionMilk("Almond Milk"),
                    ),
                    ButtonSwitch(
                      textName: "Half Cream Milk",
                      num: 4,
                      click: (b) => toggleSelectionMilk("Half Cream Milk"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "Soy Milk",
                      num: 3,
                      click: (b) => toggleSelectionMilk("Soy Milk"),
                    ),
                    ButtonSwitch(
                      textName: "Oat Milk",
                      num: 4,
                      click: (b) => toggleSelectionMilk("Oat Milk"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "Lactose Free Milk",
                      num: 5,
                      click: (b) => toggleSelectionMilk("Lactose Free Milk"),
                    ),
                  ],
                ),
                const TextName(
                    textName: "Choice Of Cup Sugar",
                    fontSize: 23,
                    textOpacity: 1,
                    top: 10,
                    left: 20),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "Sugar X1",
                      num: 10,
                      click: (b) => toggleSelectionSugar("Sugar X1"),
                    ),
                    ButtonSwitch(
                      textName: "Sugar X2",
                      num: 11,
                      click: (b) => toggleSelectionSugar("Sugar X2"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ButtonSwitch(
                      textName: "½ Sugar",
                      num: 12,
                      click: (b) => toggleSelectionSugar("½ Sugar"),
                    ),
                    ButtonSwitch(
                      textName: "No Sugar",
                      num: 13,
                      click: (b) => toggleSelectionSugar("No Sugar"),
                    ),
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
                        BlocListener<UserDataCubit, UserDataState>(
                          listener: (context, state) {
                            if (state is UserDataSuccess) {
                              log("wow");
                            }
                          },
                          child: ElevatedButton(
                            onPressed: () async {
                              await Order.addOrder(
                                  name: widget.categryModels.name,
                                  image: widget.categryModels.image,
                                  salary: widget.categryModels.salary,
                                  filling: choiceFilling,
                                  milk: choiceMilk,
                                  sugar: choiceSugar,
                                  number: value,
                                  id: BlocProvider.of<UserDataCubit>(context)
                                      .userModel!
                                      .id);
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: const TextName(
                              textName: "Submit ",
                              fontSize: 13,
                              textOpacity: 1,
                            ),
                          ),
                        ),
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
                image: NetworkImage(widget.categryModels.image),
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
 final int num;
 final Function(bool) click;
  const ButtonSwitch(
      {super.key,
      required this.textName,
      required this.num,
      required this.click});
  final String textName;

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 10),
      child: Row(
        children: [
          CupertinoSwitch(
            value:
                choiceMilk == widget.textName || choiceSugar == widget.textName,
            onChanged: widget.click,
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
 final int num;
  final VoidCallback click;

  const ElevatedButtonCustom(
      {super.key, required this.name, required this.num, required this.click});

  @override
  State<ElevatedButtonCustom> createState() => _ElevatedButtonCustomState();
}

class _ElevatedButtonCustomState extends State<ElevatedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: ElevatedButton(
        onPressed: widget.click,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(80, 30),
            backgroundColor:
                choiceFilling == widget.name ? Colors.green : Colors.white),
        child: TextName(
            textOpacity: .8,
            fontSize: 15,
            textName: widget.name,
            colors:  choiceFilling == widget.name ? Colors.white : Colors.black),
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
