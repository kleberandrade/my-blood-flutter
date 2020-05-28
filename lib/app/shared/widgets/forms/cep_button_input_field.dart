import 'package:flutter/material.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CepButtonInputField extends StatefulWidget {
  final String label;
  final Color fillColor;
  final bool busy;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;
  final Function(String) onPressed;
  final IconData icon;
  final String textInput;
  final TextEditingController controller;

  const CepButtonInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.fillColor = const Color(0xfff3f3f4),
    this.textInputType = TextInputType.number,
    this.validator,
    this.icon = Icons.search,
    this.textInput,
    this.controller,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _CepButtonInputFieldState createState() => _CepButtonInputFieldState();
}

class _CepButtonInputFieldState extends State<CepButtonInputField> {
  String textField = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextFormField(
              enabled: !widget.busy,
              controller: new MaskedTextController(mask: '00000-000',text: widget.textInput),
              keyboardType: widget.textInputType,
              validator: widget.validator,
              onSaved: widget.onSaved,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.label,
                fillColor: widget.fillColor,
                filled: true,
              ),
              onChanged: (value) {
                textField = value;
              },
            ),
          ),
          Container(
            width: 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: !widget.busy ? accentColor : widget.fillColor,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: IconButton(
              icon: Icon(
                widget.icon,
                color: !widget.busy ? canvasColor : Colors.black38,
              ),
              onPressed: !widget.busy
                  ? () {
                      widget.onPressed(textField);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
