import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login_page.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new LoginPage(),
      backgroundColor: Theme.of(context).primaryColor,
      loaderColor: Theme.of(context).canvasColor,
      photoSize: 75.0,
      image: Image.asset('lib/assets/logo.png', color: Colors.white),
      title: Text(
        'My Blood',
        style: TextStyle(
          fontSize: 32.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
