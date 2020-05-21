import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_blood/app/modules/login/pages/splash_page.dart';
import 'package:my_blood/app/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Blood',
      theme: appTheme,
      home: SplashPage(),
    );
  }
}
