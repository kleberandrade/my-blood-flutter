import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage({
    @required this.message,
    this.icon,
    this.iconSize = 64.0,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon != null
              ? Icon(
                  icon,
                  size: iconSize,
                  color: Colors.grey,
                )
              : SizedBox(),
          message != null ? SizedBox(height: 20.0) : SizedBox(),
          message != null
              ? Text(
                  message ?? '',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Theme.of(context).accentColor
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
