import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final String label;
  final bool forgetPassword;
  final bool busy;
  final Function onTap;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) validator;

  const PasswordInputField({
    Key key,
    this.label = 'Senha',
    this.onSaved,
    this.busy = false,
    this.forgetPassword = false,
    this.onTap,
    this.textInputType,
    this.validator,
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
          TextFormField(
            enabled: !widget.busy,
            obscureText: _isHidden,
            keyboardType: widget.textInputType,
            validator: widget.validator,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              labelText: widget.label,
              suffixIcon: IconButton(
                icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
                onPressed: _toggleVisibility,
              ),
            ),
          ),
          Visibility(
            visible: widget.forgetPassword,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: widget.onTap,
                child: Text(
                  'Esqueceu a senha ?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
