import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color txtColor;
  final Function onClick;

  MyButton(this.text, {this.color = const Color.fromARGB(255, 194, 194, 194), this.txtColor = Colors.black, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 60,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black54, width: 2)),
        child: TextButton(
            onPressed: onClick(),
            child: Text(
              text,
              style: TextStyle(color: txtColor, fontSize: 26, fontWeight: FontWeight.bold, fontFamily: ''),
            )));
  }
}
