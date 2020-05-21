import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/login/controllers/register_controller.dart';
import 'package:my_blood/app/modules/login/pages/login_page.dart';
import 'package:my_blood/app/modules/login/widgets/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/password_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';
import 'package:my_blood/app/themes/app_theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = new GlobalKey<FormState>();
  final _controller = new RegisterController();

  onGoToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
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
                CustomInputField(label: 'Nome'),
                SizedBox(height: 10),
                CustomInputField(label: 'Email'),
                SizedBox(height: 10),
                PasswordInputField(),
                SizedBox(height: 20),
                SubmitButton(
                  firstColor: accentColor,
                  secondColor: primaryColor,
                ),
                Expanded(child: SizedBox()),
                TextButton(
                  question: 'Já tem uma conta ?',
                  label: 'Login',
                  onTap: onGoToLoginPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
