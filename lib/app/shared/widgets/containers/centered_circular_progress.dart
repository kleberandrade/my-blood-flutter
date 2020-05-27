import 'package:flutter/material.dart';

class CenteredCircularProgress extends StatelessWidget {
  final String message;
  final double loadingSize;
  final double fontSize;

  CenteredCircularProgress({
    this.message,
    this.loadingSize = 64.0,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: loadingSize,
            width: loadingSize,
            child: CircularProgressIndicator(),
          ),
          message != null ? SizedBox(height: 20.0) : SizedBox(),
          message != null
              ? Text(
                  message ?? '',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w300,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
