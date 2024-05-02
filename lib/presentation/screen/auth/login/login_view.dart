import 'package:diary/presentation/screen/auth/login/widgets/find_auth_text.dart';
import 'package:diary/presentation/screen/auth/login/widgets/info_text.dart';
import 'package:diary/presentation/widgets/based_app_bar.dart';
import 'package:diary/presentation/widgets/based_text_form_field.dart';
import 'package:diary/presentation/widgets/outlined_primary_color_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const BasedTextFormField(hindText: "아이디"),
          const SizedBox(height: 20),
          const BasedTextFormField(hindText: "비밀번호"),
          const SizedBox(height: 20),
          _buildButtonContainer(context, OutlinedPrimaryColorButton(text: "로그인", color: primaryColor, radius: 10)),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [FindAuthText()],
          ),
          const InfoText(),
        ],
      ),
    );
  }

  Widget _buildButtonContainer(BuildContext context, Widget child) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(height: 55, width: width, child: child);
  }
}
