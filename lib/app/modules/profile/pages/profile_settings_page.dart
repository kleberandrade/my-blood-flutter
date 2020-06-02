import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/login/pages/sign_in_page.dart';
import 'package:my_blood/app/modules/profile/controllers/settings_controller.dart';
import 'package:provider/provider.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {

  SettingsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<SettingsController>(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Sair do aplicativo'),
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          _controller.signOut().then((value) {
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
          });
        },
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Usar modo escuro?'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              _controller.changeBrightness(context, value);
            },
          ),
          SwitchListTile(
            title: Text('Receber notificações somente do meu tipo sanguíneo?'),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}