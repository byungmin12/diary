import 'package:flutter/material.dart';

class FindAuthText extends StatelessWidget {
  const FindAuthText({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return TextButton(
      onPressed: () {},
      child: Text(
        "아이디/비밀번호 찾기",
        style: TextStyle(
          color: primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
        ),
      ),
    );
  }
}
