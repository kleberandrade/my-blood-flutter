import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'My Blood',
      theme: appTheme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}