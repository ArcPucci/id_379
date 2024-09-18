import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => context.go('/welcome'));
  }

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
