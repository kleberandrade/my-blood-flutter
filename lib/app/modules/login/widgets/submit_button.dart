import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color firstColor;
  final Color secondColor;
  final bool busy;

  const SubmitButton({
    Key key,
    this.label = 'Login',
    this.icon,
    this.busy = false,
    @required this.firstColor,
    @required this.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            firstColor,
            secondColor,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: icon != null,
            child: Icon(
              icon ?? null,
              color: Colors.white,
            ),
          ),
          SizedBox(width: icon != null ? 20 : 0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
