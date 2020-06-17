import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class LocalImagePath {
  static Future<String> readFile(String urlImage) async {
    var response = await http.get(urlImage);
    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/test.jpg');
    File createdFile = await file.create(recursive: true);
    if (await createdFile.exists()) file.writeAsBytesSync(response.bodyBytes);
    print(file.path);
    return file.path ?? '';
  }
}
