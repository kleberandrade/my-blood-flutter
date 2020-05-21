import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_blood/app/modules/login/widgets/email_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/horizontal_line.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/password_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/social_submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: height * 0.05),
              Logotipo(color: Theme.of(context).primaryColor),
              SizedBox(height: height * 0.05),
              EmailInputField(),
              SizedBox(height: 10),
              PasswordInputField(),
              SizedBox(height: 20),
              SubmitButton(),
              SizedBox(height: 20),
              HorizontalLine(),
              SizedBox(height: 20),
              SocialSubmitButton(
                label: 'Login com Google',
                icon: FontAwesomeIcons.google,
                backgroundColor: const Color(0xfff54a3a),
              ),
              SizedBox(height: 20),
              TextButton(
                question: 'Não tem uma conta ?',
                label: 'Registre-se',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
