import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class PreGameScreen extends StatelessWidget {
  const PreGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(23.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text("Game", style: AppTextStyles.bold48),
        ),
        Gap(36.h),
        Image.asset(
          'assets/png/tiger3.png',
          width: 311.w,
          height: 291.h,
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              width: 327.w,
              child: Text(
                "Use taps to keep the spinning tops moving. The game automatically counts how many revolutions each spinning top has made, at the end the total sum is calculated, this will be your result.",
                style: AppTextStyles.medium18,
              ),
            ),
          ),
        ),
        CustomButton1(
          text: 'Start',
          width: 123.w,
          height: 40.h,
          overlayColor: Color(0xFF027A9A).withOpacity(0.32),
          onTap: () => context.go('/pre_game/game'),
        ),
        Gap(19.h),
      ],
    );
  }
}
