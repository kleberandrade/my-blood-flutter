import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  final String image;
  final double width;
  final Color color;
  final String label;

  const Logotipo({
    Key key,
    this.label,
    this.image = 'lib/assets/logo.png',
    this.width = 100.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            color: color,
            width: width,
          ),
          SizedBox(height: 8.0),
          label != null
              ? Text(
                  label ?? '',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
