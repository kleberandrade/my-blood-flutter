import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class FoneInputField extends StatelessWidget {
  final String label;
  final bool busy;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;
  final String controller;

  const FoneInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.textInputType = TextInputType.phone,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        enabled: !busy,
        controller: new MaskedTextController(mask: '(00)000000000', text: controller),
        keyboardType: textInputType,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          filled: true,
        ),
      ),
    );
  }
}
