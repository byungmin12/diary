import 'package:flutter/material.dart';

class RoundBottomSheet extends StatelessWidget {
  final double height;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const RoundBottomSheet({super.key, required this.height, this.child, this.borderRadius, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius ?? 40),
          topLeft: Radius.circular(borderRadius ?? 40),
        ),
      ),
      padding: padding ?? const EdgeInsets.only(top: 20, bottom: 40),
      child: child,
    );
  }
}
