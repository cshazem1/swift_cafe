
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/background.dart';
import 'package:swift_cafe/components/custom_button.dart';
import 'package:swift_cafe/components/custom_text_name.dart';
import 'package:swift_cafe/components/text_field_components.dart';
import 'package:swift_cafe/cubits/local_image_cuibt/local_image_cubit.dart';

import '../components/Image.dart';

import '../cubits/local_image_cuibt/local_image_states.dart';
import '../firebase/cloud_storage/add_categry.dart';
import '../helper/show_snack_bar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isLoading = true;

  String? name, image, salary, desc;

  bool onClick = true;

  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
         Background(imageUrl:"image/cafe_background.webp"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Container(
            padding: const EdgeInsets.only(top: 50),
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
            child: Form(
              key: globalKey,
              autovalidateMode: autoValidateMode,
              child: SingleChildScrollView(
                child: Column(children: [
                  const TextName(textName: "Add New Item", fontSize: 30, textOpacity: .9,colors: Colors.deepOrange,fontWeight: FontWeight.bold),
                  SizedBox(height: 50,),
                  ImageU(isLoading),
                  const SizedBox(height: 50,),
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
                  BlocConsumer<LocalImageCubit, LocationImageStated>(builder: (context, state) {
              if (state is InitialLocationImageState) {
              return CustomButton(
              logInButton: true,
              buttonName: "sure",
              onPress: () {
              showToast(context, "Please Enter Your Photo");
              });
              } else if (state is ImageUploadStates) {
              return CustomButton(
              buttonName: "sure",
              logInButton: true,
              onPress: () {
              validate(context);
              });
              }
              if (state is UploadImageToFirebaseLoadingStates) {

              return const CircularProgressIndicator();
              } else if (state is UploadImageToFirebaseSuccessStates) {
              WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
              Navigator.pop(context);
              BlocProvider.of<LocalImageCubit>(context)
                  .getInitial();
              },
              );
              }
              return const Text("data");
              },
                   listener: (context, state) {
    if (state is UploadImageToFirebaseLoadingStates) {
      setState(() {
        isLoading=false;
      });
    }
                   },)
               ,
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  validate(context) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      await BlocProvider.of<LocalImageCubit>(context)
          .UploadImageToFirebase(
              BlocProvider.of<LocalImageCubit>(context).xFile!);
      image = BlocProvider.of<LocalImageCubit>(context).locationImage;
      isLoading = false;
      setState(() {});
      await Categry.addCategry(
          name: name!, desc: desc!, image: image!, salary: salary!);
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
