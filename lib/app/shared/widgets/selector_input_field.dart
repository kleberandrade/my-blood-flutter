import 'package:flutter/material.dart';

class SelectorInputField extends StatefulWidget {
  final String label;
  final Color fillColor;
  final bool busy;
  final Function(String) onSaved;
  final TextEditingController controller;
  final List<String> items;

  const SelectorInputField({
    Key key,
    this.label,
    this.onSaved,
    this.busy = false,
    this.fillColor = const Color(0xfff3f3f4),
    this.controller,
    this.items,
  }) : super(key: key);

  @override
  _SelectorInputFieldState createState() => _SelectorInputFieldState();
}

class _SelectorInputFieldState extends State<SelectorInputField> {
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
        return AlertDialog(
          title: new Text(widget.label),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items
                      .map((item) => RadioListTile(
                            title: Text(item),
                            value: item,
                            groupValue: _itemSelected,
                            onChanged: (value) {
                              setState(() {
                                _itemSelected = value;
                              });
                            },
                          ))
                      .toList(),
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
      },
    );
  }
}
