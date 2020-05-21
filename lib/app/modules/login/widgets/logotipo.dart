import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  final String image;
  final double width;
  final Color color;

  const Logotipo({
    Key key,
    this.image = 'lib/assets/logo.png',
    this.width = 100.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        image,
        color: color,
        width: width,        
      ),
    );
  }
}
