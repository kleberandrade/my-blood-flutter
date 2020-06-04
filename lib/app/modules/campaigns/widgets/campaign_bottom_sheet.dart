import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_share/social_share.dart';

class CampaignBottomSheet{
  static final hashtags = [
    'doesangue',
    'salvevidas',
    'sangue',
    'doacaodesangue'
  ];

  static void show(BuildContext context, String text) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(FontAwesomeIcons.copy),
                title: new Text('Copiar'),
                onTap: () {
                  Navigator.pop(context);
                  SocialShare.copyToClipboard(text);
                },
              ),
              new ListTile(
                leading: new Icon(FontAwesomeIcons.telegram),
                title: new Text('Telegram'),
                onTap: () {
                  Navigator.pop(context);
                  SocialShare.shareTelegram(text);
                },
              ),
              new ListTile(
                leading: new Icon(FontAwesomeIcons.whatsapp),
                title: new Text('WhatsApp'),
                onTap: () {
                  Navigator.pop(context);
                  SocialShare.shareWhatsapp(text);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
