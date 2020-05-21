import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_blood/app/modules/login/controllers/login_controller.dart';
import 'package:my_blood/app/modules/login/pages/forget_password_page.dart';
import 'package:my_blood/app/modules/login/pages/register_page.dart';
import 'package:my_blood/app/modules/login/widgets/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/horizontal_line.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/password_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';
import 'package:my_blood/app/themes/app_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  final _controller = new LoginController();

  onSuccess() {}

  onError() {}

  onComplete() {}

  onGoToRegisterPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  onGoToForgetPasswordPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPasswordPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Container(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 2, child: SizedBox()),
                Logotipo(
                  label: 'My Blood',
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(child: SizedBox()),
                CustomInputField(label: 'Email'),
                SizedBox(height: 10),
                PasswordInputField(
                  forgetPassword: true,
                  onTap: onGoToForgetPasswordPage,
                ),
                SizedBox(height: 20),
                SubmitButton(
                    firstColor: accentColor, secondColor: primaryColor),
                SizedBox(height: 20),
                HorizontalLine(),
                SizedBox(height: 20),
                SubmitButton(
                  label: 'Login com Google',
                  icon: FontAwesomeIcons.google,
                  firstColor: accentColor,
                  secondColor: primaryColor,
                ),
                Expanded(child: SizedBox()),
                TextButton(
                  question: 'Não tem uma conta ?',
                  label: 'Registrar',
                  onTap: onGoToRegisterPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
