import 'package:flutter/material.dart';

class ButtonInputField extends StatefulWidget {
  final String label;
  final bool busy;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;
  final Function(String) onPressed;
  final TextEditingController controller;
  final IconData icon;

  const ButtonInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.controller,
    this.icon = Icons.search,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _ButtonInputFieldState createState() => _ButtonInputFieldState();
}

class _ButtonInputFieldState extends State<ButtonInputField> {
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
              controller: widget.controller,
              keyboardType: widget.textInputType,
              validator: widget.validator,
              onSaved: widget.onSaved,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.label,
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
              color: !widget.busy ? Theme.of(context).accentColor : Theme.of(context).dividerColor,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: IconButton(
              icon: Icon(
                widget.icon,
                color: !widget.busy ? Colors.white : Colors.black38,
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
