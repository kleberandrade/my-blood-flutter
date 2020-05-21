import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Function(String) onSaved;
  final Color fillColor;

  const CustomInputField({
    Key key,
    this.label,
    this.onSaved,
    this.fillColor = const Color(0xfff3f3f4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: fillColor,
              filled: true,
            ),
            onSaved: onSaved,
          )
        ],
      ),
    );
  }
}
