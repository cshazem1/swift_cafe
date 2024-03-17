// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_cafe/cubits/local_image_cuibt/local_image_cubit.dart';

// ignore: must_be_immutable
class ImageU extends StatefulWidget {
  bool onClick;
  ImageU(this.onClick, {super.key});

  @override
  State<ImageU> createState() => _ImageUState();
}

class _ImageUState extends State<ImageU> {
  File? galleryFile;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
            width: 215,
            height: 215,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 20,
                blurRadius: 18,
                offset: const Offset(0, 15), // changes position of shadow
              ),
            ], color: Colors.black, borderRadius: BorderRadius.circular(200)),
            child: galleryFile == null
                ? Center(
                    child: Container(

                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(.8),
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ],

                          image: const DecorationImage(
                              image: AssetImage("image/add_item.webp"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(200)),
                      width: 200,
                      height: 200,
                    ),
                  )
                : Center(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(.8),
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ],

                          image: DecorationImage(

                              image: FileImage(galleryFile!), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(200)),
                      width: 200,
                      height: 200,
                    ),
                  ),
          ),
          Positioned(
              right: 70,
              bottom: 15,
              child: SizedBox(
                width: 75,
                height: 45,
                child: widget.onClick
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (!states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .primaryColor;
                              }
                             else if (states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .hintColor;
                              }
                              return null; // Use the component's default.
                            },
                          ),
                        ),
                        onPressed: () {
                          _showPicker(context: context);
                        },
                        child: const Center(
                            child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 25,
                        )))
                    : null,
              ))
        ])
      ],
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xFilePicked = pickedFile;

    setState(
      () {
        BlocProvider.of<LocalImageCubit>(context).getImageUpload(xFilePicked!);
        galleryFile = File(pickedFile!.path);
      },
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
