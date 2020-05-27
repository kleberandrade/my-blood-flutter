import 'package:flutter/material.dart';

class BackDialog extends StatelessWidget {
  final Function onConfirm;
  final Function onCancel;
  final String title;

  BackDialog({@required this.onConfirm, @required this.onCancel, @required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(title),
      content: new Text('Você tem certeza que deseja sair do cadastro de '+title.toLowerCase()+'?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Não'),
          onPressed: onConfirm,
        ),
        FlatButton(
          child: Text('Sim'),
          onPressed: onCancel,
        ),
      ],
    );
  }
}