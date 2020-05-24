import 'package:flutter/material.dart';
import 'package:my_blood/app/themes/app_theme.dart';

class ListTileHeader extends StatefulWidget {
  final String title;

  ListTileHeader(this.title);

  @override
  _ListTileHeaderState createState() => _ListTileHeaderState();
}

class _ListTileHeaderState extends State<ListTileHeader> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title ?? "",
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
