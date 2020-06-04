import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/login/controllers/account_controller.dart';
import 'package:my_blood/app/modules/login/pages/sign_up_page.dart';
import 'package:my_blood/app/shared/widgets/forms/custom_input_field.dart';
import 'package:my_blood/app/modules/login/widgets/logotipo.dart';
import 'package:my_blood/app/modules/login/widgets/text_button.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/shared/widgets/forms/submit_button.dart';
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  sendPasswordResetEmail() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      _controller.sendPasswordResetEmail(
        onSuccess: onSuccess,
        onError: onError,
      );
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
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
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
                Expanded(flex: 2, child: SizedBox()),
                Logotipo(
                  color: Theme.of(context).accentColor,
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
                    textInputType: TextInputType.emailAddress,
                  );
                }),
                SizedBox(height: 20),
                Observer(builder: (_) {
                  return SubmitButton(
                    label: 'Enviar',
                    busy: _controller.busy,
                    firstColor: Theme.of(context).accentColor,
                    secondColor: Theme.of(context).primaryColor,
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
