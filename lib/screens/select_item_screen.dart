import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:swift_cafe/models/categry_models.dart';
import 'package:swift_cafe/models/user_model.dart';

import '../components/button_switch.dart';
import '../components/custom_check_box.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_text_name.dart';
import '../cubits/my_id_cubit/get_id_cubit.dart';
import '../cubits/my_id_cubit/get_id_state.dart';
import '../helper/show_snack_bar.dart';
import '../public.dart';
import '../firebase/cloud_storage/order.dart';



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
      const DropdownMenuItem(value: "1", child: Text("1")),
      const DropdownMenuItem(value: "2", child: Text("2")),
      const DropdownMenuItem(value: "3", child: Text("3")),
      const DropdownMenuItem(value: "4", child: Text("4")),
    ];
    return menuItems;
  }

  String value = "1";
  double? totalSalary;
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    String date =
        "${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}/${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
    totalSalary = double.parse(widget.categryModels.salary);
    double dValue = double.parse(value);
    totalSalary = totalSalary! * dValue;
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        dropdownColor: Colors.grey,
                        iconEnabledColor: Colors.black,

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
                      padding: const EdgeInsets.only(left: 10),
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
                        BlocListener<GetIdCubit, GetIdState>(
                          listener: (context, state) {
                            if (state is GetIdSuccess) {
                              print("object");
                              WidgetsBinding.instance.addPostFrameCallback((_) {   showToast(context,"Success");

                            });}
                          },
                          child: ElevatedButton(
                            onPressed: () async {
                              await Order.addOrder(
                                  data: date,
                                  name: widget.categryModels.name,
                                  image: widget.categryModels.image,
                                  salary: widget.categryModels.salary,
                                  filling: choiceFilling,
                                  milk: choiceMilk,
                                  sugar: choiceSugar,
                                  number: value,
                                  id: BlocProvider.of<GetIdCubit>(context).id!);
    WidgetsBinding.instance.addPostFrameCallback((_) {   showToast(context,"Success");
    Navigator.pop(context);

    });}
                              // ignore: use_build_context_synchronously

,                            style: ElevatedButton.styleFrom(
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






