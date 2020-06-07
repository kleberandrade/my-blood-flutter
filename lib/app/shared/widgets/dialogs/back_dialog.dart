import 'package:flutter/material.dart';

class BackDialog extends StatelessWidget {
  final Function onConfirm;
  final Function onCancel;
  final String title;
  final String msg;

  BackDialog({@required this.onConfirm, @required this.onCancel, @required this.title, this.msg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(title),
      content: new Text('Você tem certeza que deseja sair do '+msg.toLowerCase()+'?'),
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