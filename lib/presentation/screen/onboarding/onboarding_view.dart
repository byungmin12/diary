import 'package:diary/presentation/screen/onboarding/bloc/bloc.dart';
import 'package:diary/presentation/widgets/image_slider.dart';
import 'package:diary/presentation/widgets/outlined_primary_color_botton.dart';
import 'package:diary/presentation/widgets/round_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  final heightFactor = 0.3;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocSelector<OnBoardingBloc, OnBoardingState, List<dynamic>>(
        selector: (state) => state.images,
        builder: (context, images) => ImageSlider(
          images: images,
          indicatorBottomPosition: (height * heightFactor),
          children: [_buildBottomSheet(context)],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
  ) {
    final double height = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).primaryColor;
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: RoundBottomSheet(
          height: height * heightFactor,
          child: Column(
            children: [
              _buildButtonContainer(
                context,
                OutlinedPrimaryColorButton(
                  onPressed: () {},
                  text: "시작하기",
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              _buildButtonContainer(
                context,
                OutlinedPrimaryColorButton(
                  onPressed: () {},
                  text: "비회원으로 구경하기",
                  borderSide: BorderSide(width: 1, color: primaryColor),
                  textColor: primaryColor,
                ),
              ),
              const Spacer(),
              _buildLoginButton(primaryColor),
            ],
          ),
        ));
  }

  Widget _buildButtonContainer(BuildContext context, Widget child) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(height: 55, width: width * 0.77, child: child);
  }

  Widget _buildLoginButton(Color color) {
    return TextButton(
      onPressed: () {},
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 12),
          children: [
            const TextSpan(
              text: '이미 다이어리가 있나요? ',
            ),
            TextSpan(text: '로그인', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
