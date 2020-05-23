import 'package:my_blood/app/modules/home/pages/home_page.dart';
import 'package:my_blood/app/modules/login/pages/forget_page.dart';
import 'package:my_blood/app/modules/login/pages/sign_in_page.dart';
import 'package:my_blood/app/modules/login/pages/sign_up_page.dart';
import 'package:my_blood/app/modules/login/pages/splash_page.dart';

final appRoutes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ForgetPage.routeName: (context) => ForgetPage(),
  HomePage.routeName: (context) => HomePage(),
  
};