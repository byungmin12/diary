import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  final textStyle = const TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildText("신규 가입을 원하시는 경우"),
        _buildText("이전 페이지로 돌아가서 시작하기 버튼을 이용해 주세요."),
      ],
    );
  }

  _buildText(String text) {
    return Text(text, style: textStyle);
  }
}
