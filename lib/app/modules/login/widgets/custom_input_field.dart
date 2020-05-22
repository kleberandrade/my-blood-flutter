import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final bool busy;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;

  const CustomInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.fillColor = const Color(0xfff3f3f4),
    this.textInputType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            enabled: !busy,
            keyboardType: textInputType,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              fillColor: fillColor,
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
