import 'package:flutter/material.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';

class CampaignDonationDialog {
  static void show(BuildContext context, {String nextDonationDate, Function onConfirm}) {
    final date = DateHelper.parse(nextDonationDate);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (DateHelper.format(date) == DateHelper.format(today) || date.isBefore(today)) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return _successDialog(context, onConfirm);
        },
      );
    } else {


      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return _wrongDialog(context, date.difference(today).inDays);
        },
      );
    }
  }

  static _successDialog(BuildContext context, Function onConfirm) {
    return AlertDialog(
      title: new Text('Doar!'),
      content: new Text(
          'Ao clicar no botão confirmar, você confirma que doou. Por favor, só clique em confirmar se você realmente fez a doação.'),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCELAR'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('CONFIRMAR'),
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
        ),
      ],
    );
  }

  static _wrongDialog(BuildContext context, int days) {

    return AlertDialog(
      title: new Text('Proibido Doar!'),
      content: new Text(
          'Infelizmente você não pode doar neste momento, falta(m) $days dia(s) para você poder doar novamente.'),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
