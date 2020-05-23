import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/login/controllers/account_controller.dart';
import 'package:my_blood/app/modules/login/pages/sign_up_page.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/submit_button.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ForgetPage extends StatefulWidget {
  static const String routeName = '/forgetpasswd';
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final _formKey = new GlobalKey<FormState>();

  AccountController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<AccountController>(context);
  }

  navigatorToRegisterPage() {
    Navigator.pushReplacementNamed(context, SignUpPage.routeName);
  }

  sendPasswordResetEmail() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      _controller.sendPasswordResetEmail(
          onSuccess: onSuccess, onError: onError);
    }
  }

  onSuccess() {
    Navigator.pop(context);

    SnackBarHelper.showSuccessMessage(context,
        title: 'Sucesso',
        message:
            'Um link de redefinição de senha foi enviado para  ${_controller.userEmail}');
  }

  onError(error) {
    SnackBarHelper.showFailureMessage(context, title: 'Erro', message: error);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: canvasColor,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 2,child: SizedBox()),
                Logotipo(
                  label: 'My Blood',
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(child: SizedBox()),
                Text(
                  'Esqueceu sua senha?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Observer(builder: (_) {
                  return CustomInputField(
                    label: 'Email',
                    busy: _controller.busy,
                    validator: Validator.isValidEmail,
                    onSaved: _controller.setEmail,
                  );
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return SubmitButton(
                    label: 'Enviar',
                    busy: _controller.busy,
                    firstColor: accentColor,
                    secondColor: primaryColor,
                    onTap: sendPasswordResetEmail,
                  );
                }),
                SizedBox(height: 20),
                Expanded(child: SizedBox()),
                TextButton(
                  question: 'Não tem uma conta ?',
                  label: 'Registrar',
                  onTap: navigatorToRegisterPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_blood/app/modules/login/controllers/login_controller.dart';
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
                PasswordInputField(forgetPassword: true),
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
*/
