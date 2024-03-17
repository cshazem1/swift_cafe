// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'local_image_states.dart';

class LocalImageCubit extends Cubit<LocationImageStated> {
  XFile? xFile;
  LocalImageCubit() : super(InitialLocationImageState());

  String? locationImage;

  // ignore: non_constant_identifier_names
  Future<void> UploadImageToFirebase(XFile pickedImage) async {
    emit(UploadImageToFirebaseLoadingStates());
    FirebaseStorage storage = FirebaseStorage.instance;
    try {
      final String fileName = path.basename(pickedImage.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        TaskSnapshot uploadTask = await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));
        var url = Uri.parse(await uploadTask.ref.getDownloadURL());
        locationImage = url.toString();
        emit(UploadImageToFirebaseSuccessStates());
        log(url.toString());
      } on FirebaseException {
        if (kDebugMode) {
          emit(LocationImageFailedStates());
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
        emit(LocationImageFailedStates());
      }
    }
  }

  getImageUpload(XFile xFile) {
    emit(ImageUploadStates());
    this.xFile = xFile;
  }

  getInitial() {
    emit(InitialLocationImageState());
  }
}
