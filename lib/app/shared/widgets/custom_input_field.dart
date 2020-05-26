import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final bool busy;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;
  final TextEditingController controller;

  const CustomInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.fillColor = const Color(0xfff3f3f4),
    this.textInputType = TextInputType.text,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        enabled: !busy,
        controller: controller,
        keyboardType: textInputType,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          fillColor: fillColor,
          filled: true,
        ),
      ),
    );
  }
}
