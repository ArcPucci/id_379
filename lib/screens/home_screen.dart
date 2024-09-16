import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(18.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text("About\nSpinning\nTop", style: AppTextStyles.extraBold48),
        ),
        Gap(63.h),
        Image.asset(
          'assets/png/tiger2.png',
          width: 333.w,
          height: 287.h,
        ),
        const Spacer(),
        CustomButton1(
          text: "Begin",
          height: 40.h,
        ),
        Gap(83.h),
      ],
    );
  }
}
