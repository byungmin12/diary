import 'package:flutter/material.dart';

class OutlinedPrimaryColorButton extends StatelessWidget {
  const OutlinedPrimaryColorButton(
      {super.key, this.onPressed, required this.text, this.color, this.borderSide, this.textColor});

  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final String text;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(backgroundColor: color, side: borderSide ?? BorderSide.none),
      child: Text(text, style: TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
