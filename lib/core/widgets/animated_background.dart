import 'package:ff_moneyblaster/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: Colors.black,
      child: const RiveAnimation.asset(
        Assets.background,
        fit: BoxFit.cover,
        useArtboardSize: true,
      ),
    );
  }
}
