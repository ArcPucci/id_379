import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:id_379/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap,
    this.height,
    required this.text,
    this.width,
  });

  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 127.w,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            width: 2.sp,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppTheme.blue3, Colors.white],
            ),
          ),
          borderRadius: BorderRadius.circular(24),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.medium16),
      ),
    );
  }
}
