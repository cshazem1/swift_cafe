import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/background.dart';
import 'package:swift_cafe/components/custom_button.dart';
import 'package:swift_cafe/components/text_field_components.dart';

import '../components/Image.dart';
import '../cubits/categry_image_cuibt/get_location_image_cubit.dart';
import '../cubits/categry_image_cuibt/get_location_image_states.dart';
import '../helper/show_snack_bar.dart';
import 'home_screen.dart';

class Admain extends StatefulWidget {
  @override
  State<Admain> createState() => _AdmainState();
}

class _AdmainState extends State<Admain> {
  bool isLoading=true;

  String? name, image, salary, desc;

  bool onClick = true;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('categry');
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        const Background(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Container(
            padding: const EdgeInsets.only(top: 200),
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
            child:  Form(
              key: globalKey,
              autovalidateMode: autoValidateMode,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageU(isLoading),
                    TextFieldComponent(
                      enable: isLoading,
                      hintText: "name",
                      labelText: 'name',
                      onChange: (data) {
                        name = data;
                      },
                    ),

                    TextFieldComponent(
                      enable: isLoading,
                      hintText: "salary",
                      labelText: 'salary',
                      onChange: (data) {
                        salary = data;
                      },
                    ),
                    TextFieldComponent(
                      enable: isLoading,
                      hintText: "description",
                      labelText: 'description',
                      onChange: (data) {
                        desc = data;
                      },
                    ),

                    BlocBuilder<GetLocationImageCubit, LocationImageStated>(
                      builder: (context, state) {
                  if (state is InitialLocationImageState) {
                  return CustomButton(
                  logInButton: true,
                  buttonName:"sure" ,
                  onPress:(){ showToast(context, "Please Enter Your Photo");
                  }
                  );

                  } else if (state is ImageUploadStates){
                  return CustomButton(
                  buttonName: "sure",
                  logInButton:true ,

                  onPress:
                  ()  {
                    isLoading=false;
setState(() {

});
                     validate(context);



                  }

                  );}
                  if(state is UploadImageToFirebaseLoadingStates){
                   return const CircularProgressIndicator();
                  }
                  else if (state is UploadImageToFirebaseSuccessStates){
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.pop(context);
                      BlocProvider.of<GetLocationImageCubit>(context)
                          .getInitial();

                    },);
                                  }
return
  Text("data");


                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

              ]  ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'name': name, // John Doe
      'desc': desc, // Stokes and Sons
      'rate': '0',
      'image': image,
      'salary':salary
      // 42
    }).then((DocumentReference docRef) {
      print("User Added with ID: ${docRef.id}");
      docRef.update({"id": docRef.id});
    }).catchError((error) => print("Failed to add user: $error"));
  }
   validate(context) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
    await  BlocProvider.of<GetLocationImageCubit>(
          context)
          .UploadImageToFirebase(BlocProvider.of<
          GetLocationImageCubit>(context)
          .xFile!);
      image =BlocProvider.of<GetLocationImageCubit>(context)
              .locationImage;
     await addUser();


    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
