import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/login/widgets/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/password_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Logotipo(color: Theme.of(context).primaryColor),
                  SizedBox(height: height * 0.05),
                  CustomInputField(label: 'Nome'),
                  SizedBox(height: 10),
                  CustomInputField(label: 'Email'),
                  SizedBox(height: 10),
                  PasswordInputField(),
                  SizedBox(height: 20),
                  SubmitButton(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TextButton(
              question: 'Já tem uma conta ?',
              label: 'Login',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
