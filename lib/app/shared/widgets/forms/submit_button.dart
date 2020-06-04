import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color firstColor;
  final Color secondColor;
  final bool busy;
  final Function onTap;

  const SubmitButton({
    Key key,
    this.label = 'Login',
    this.icon,
    this.busy = false,
    @required this.firstColor,
    @required this.secondColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
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
            busy
                ? Container(
                    height: 21,
                    width: 21,
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).canvasColor,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
