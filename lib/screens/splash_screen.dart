import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.black,
      child: SafeArea(
        child: Column(
          children: [
            Gap(148.h),
            ShaderMask(
              shaderCallback: (Rect bounds) =>
                  AppTheme.blueGradient.createShader(bounds),
              child: Text(
                "JoyFactory:\nspinning\ntiger",
                style: AppTextStyles.extraBold48,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(40.h),
            CustomCircleIndicator(color: Colors.white, size: 52.sp),
          ],
        ),
      ),
    );
  }
}
