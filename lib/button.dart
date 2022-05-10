import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  CalcButton(this.text, this.color, this.textColor, this.callback);
  final String text;
  final color;
  final textColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
