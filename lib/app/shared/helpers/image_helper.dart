import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:my_blood/app/themes/app_theme.dart';

class ImageHelper {
  static Future<File> getImage(bool camera) async {
    final image = await ImagePicker.pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      final cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        compressQuality: 100,
        maxWidth: 500,
        maxHeight: 500,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarWidgetColor: Colors.white,
          toolbarColor: primaryColor,
          toolbarTitle: 'Ajuste a sua foto :)',
          statusBarColor: accentColor,
          backgroundColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      return cropped;
    }
  }

  static Future uploadImage({File image, Function(String) onSuccess}) async {
    String filename = path.basename(image.path);
    StorageReference storage = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask task = storage.putFile(image);
    StorageTaskSnapshot snapshot = await task.onComplete;
    storage.getDownloadURL().then((fileURL) {
      onSuccess(fileURL);
    });
  }
}
