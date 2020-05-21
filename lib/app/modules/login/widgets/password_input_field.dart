import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String label;
  final Function(String) onSaved;
  final Color fillColor;

  const PasswordInputField({
    Key key,
    this.label = 'Senha',
    this.onSaved,
    this.fillColor = const Color(0xfff3f3f4),
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: _isHidden,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: widget.fillColor,
              filled: true,
              suffixIcon: IconButton(
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: _toggleVisibility,
              ),
            ),
            onSaved: widget.onSaved,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerRight,
            child: Text(
              'Esqueceu a senha ?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
