import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
