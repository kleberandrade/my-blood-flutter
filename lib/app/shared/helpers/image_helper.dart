import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class ImageHelper {
  static Future<File> getImage(BuildContext context,  bool camera) async {
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
          toolbarColor: Theme.of(context).primaryColor,
          toolbarTitle: 'Ajuste a sua foto :)',
          statusBarColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
      return cropped;
    }

    return null;
  }

  static Future uploadImage({File image, Function(String) onSuccess}) async {
    String filename = path.basename(image.path);
    StorageReference storage = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = storage.putFile(image);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      onSuccess(url);
    }
  }
}
