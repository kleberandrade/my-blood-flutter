import 'package:flutter/material.dart';

class ListTileHeader extends StatefulWidget {
  final String title;
  final double leftPadding;

  ListTileHeader(this.title, {this.leftPadding = 20.0});

  @override
  _ListTileHeaderState createState() => _ListTileHeaderState();
}

class _ListTileHeaderState extends State<ListTileHeader> {



  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: widget.leftPadding),
      title: Text(
        widget.title ?? "",
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
