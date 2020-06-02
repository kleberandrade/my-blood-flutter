import 'package:flutter/material.dart';
import 'package:my_blood/app/themes/app_theme.dart';

class BloodTypeInputField extends StatefulWidget {
  final String label;
  final Color fillColor;
  final bool busy;
  final Function(String) onSaved;
  final TextEditingController controller;

  const BloodTypeInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.fillColor = const Color(0xfff3f3f4),
    this.controller,
  }) : super(key: key);

  @override
  _BloodTypeInputFieldState createState() => _BloodTypeInputFieldState();
}

class _BloodTypeInputFieldState extends State<BloodTypeInputField> {
  String _itemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        enabled: !widget.busy,
        controller: widget.controller,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.label,
          fillColor: widget.fillColor,
          filled: true,
        ),
        readOnly: true,
        onTap: () {
          _showDialog(context);
        },
      ),
    );
  }

  _showDialog(BuildContext context) {
    _itemSelected = widget.controller.text;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _bloodDialog();
      },
    );
  }

  _bloodDialog() {
    return AlertDialog(
      title: new Text(widget.label),
      content: Container(
        child: FormField<String>(
          initialValue: _itemSelected,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _button('A+', state: state),
                    SizedBox(width: 10),
                    _button('B+', state: state),
                    SizedBox(width: 10),
                    _button('AB+', state: state),
                    SizedBox(width: 10),
                    _button('O+', state: state),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _button('A-', state: state),
                    SizedBox(width: 10),
                    _button('B-', state: state),
                    SizedBox(width: 10),
                    _button('AB-', state: state),
                    SizedBox(width: 10),
                    _button('O-', state: state),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _button('NÃO SEI', state: state),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCELAR'),
          onPressed: () {
            _itemSelected = widget.controller.text;
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            if (_itemSelected.isNotEmpty) {
              widget.controller.text = _itemSelected;
            }
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _button(
    String label, {
    FormFieldState<String> state,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          state.didChange(label);
          _itemSelected = label;
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: state.value == label ? primaryColor : Colors.black38,
            ),
            color: state.value == label ? primaryColor : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: state.value == label ? canvasColor : Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}