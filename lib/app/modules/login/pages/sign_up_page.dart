import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/home/pages/home_page.dart';
import 'package:my_blood/app/modules/login/controllers/account_controller.dart';
import 'package:my_blood/app/modules/login/pages/sign_in_page.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/password_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  AccountController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<AccountController>(context);
  }

  navigatorToLoginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  signUpWithCredentials() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      _controller.signUpWithCredentials(
          onSuccess: onSignUpSuccess, onError: onSignUpError);
    }
  }

  onSignUpError(error) {
    SnackBarHelper.showFailureMessage(context, title: 'Erro', message: error);
  }

  onSignUpSuccess() {
    _controller.signInWithCredentials(
        onSuccess: navigatorToHomePage, onError: onSignInError);
  }

  onSignInError(error) {
    navigatorToLoginPage();
  }

  navigatorToHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
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
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(child: SizedBox()),
                Observer(builder: (_) {
                  return CustomInputField(
                    label: 'Nome',
                    busy: _controller.busy,
                    validator: Validator.isValidateName,
                    onSaved: _controller.setName,
                  );
                }),
                SizedBox(height: 10),
                Observer(builder: (_) {
                  return CustomInputField(
                    label: 'Email',
                    busy: _controller.busy,
                    validator: Validator.isValidEmail,
                    onSaved: _controller.setEmail,
                  );
                }),
                SizedBox(height: 10),
                Observer(builder: (_) {
                  return PasswordInputField(
                    forgetPassword: false,
                    busy: _controller.busy,
                    validator: Validator.isValidatePassword,
                    onSaved: _controller.setPassword,
                  );
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return SubmitButton(
                    label: 'Registrar',
                    busy: _controller.busy,
                    firstColor: accentColor,
                    secondColor: primaryColor,
                    onTap: signUpWithCredentials,
                  );
                }),
                Expanded(child: SizedBox()),
                TextButton(
                  question: 'Já tem uma conta ?',
                  label: 'Login',
                  onTap: navigatorToLoginPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
