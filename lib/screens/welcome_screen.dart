import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.black,
      child: SafeArea(
        child: Column(
          children: [
            Gap(32.h),
            Image.asset(
              'assets/png/tiger1.png',
              width: 311.w,
              height: 291.h,
            ),
            Gap(40.h),
            ShaderMask(
              shaderCallback: (Rect bounds) =>
                  AppTheme.blueGradient.createShader(bounds),
              child: Text(
                "Welcome",
                style: AppTextStyles.extraBold48,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(28.h),
            const CustomButton1(text: "Start"),
            const Spacer(),
            SizedBox(
              width: 343.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Privacy policy", style: AppTextStyles.bold16),
                  Text("Terms of Use", style: AppTextStyles.bold16),
                ],
              ),
            ),
            Gap(18.h),
          ],
        ),
      ),
    );
  }
}
