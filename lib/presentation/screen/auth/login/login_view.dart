import 'package:diary/presentation/widgets/based_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasedAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/logo.svg', semanticsLabel: 'diary Logo', fit: BoxFit.contain),
          const SizedBox(width: 8.35),
          const Text('로그인', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      )),
      body: Container(),
    );
  }
}
