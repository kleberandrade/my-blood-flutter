import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;

class FirebaseImageHelper {
  static Future<File> getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
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
