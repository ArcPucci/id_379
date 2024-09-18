import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Gap(168.h),
            Image.asset(
              'assets/png/broken_heart.png',
              width: 95.w,
              height: 95.h,
            ),
            Gap(12.h),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white,
                    Color(0xFF00B0FC),
                    Color(0xFF0083FC),
                  ],
                ).createShader(bounds);
              },
              child: Text("You lost", style: AppTextStyles.bold60),
            ),
            Gap(12.h),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white,
                    Color(0xFF00B0FC),
                    Color(0xFF0083FC),
                  ],
                ).createShader(bounds);
              },
              child: Text("Result: $score", style: AppTextStyles.bold60),
            ),
            Spacer(),
            CustomButton1(
              text: 'Ok',
              width: 123.w,
              height: 40.h,
              onTap: () {
                Navigator.of(context).pop();
                context.pop();
              },
            ),
            Gap(19.h),
          ],
        ),
      ),
    );
  }
}
