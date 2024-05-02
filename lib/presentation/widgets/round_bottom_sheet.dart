import 'package:flutter/material.dart';

class RoundBottomSheet extends StatelessWidget {
  final double height;
  final Widget? child;

  const RoundBottomSheet({super.key, required this.height, this.child});

  final decoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
      topLeft: Radius.circular(40),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: decoration,
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: child,
    );
  }
}
