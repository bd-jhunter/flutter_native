import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JHButtons {
  static Widget applyButton({@required String title, Color titleColor, Color backgroundColor, double fontSize, double width, @required double height, @required VoidCallback onPressed}) {
    RaisedButton button = RaisedButton(
      child: Text(
        title,
        style: TextStyle(color: titleColor ?? Colors.white, fontSize: fontSize ?? 14, fontWeight: FontWeight.normal),
      ),
      color: backgroundColor ?? Color(0xFFF20C32),
      splashColor: backgroundColor ?? Color(0xFFF20C32),
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(height / 2))),
      onPressed: onPressed,
    );

    return SizedBox(
      width: width,
      height: height,
      child: button,
    );
  }
}
