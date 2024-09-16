import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:id_379/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    this.onTap,
    required this.text,
    this.hasSwitcher = false,
    this.onChanged,
    this.enabled = true,
  });

  final VoidCallback? onTap;
  final String text;
  final bool hasSwitcher;
  final void Function(bool)? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: GradientBoxBorder(
            width: 2.sp,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppTheme.blue3, Colors.white],
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(text, style: AppTextStyles.medium16),
            if (hasSwitcher)
              Positioned(
                right: 16.w,
                child: CupertinoSwitch(
                  value: enabled,
                  activeColor: AppTheme.blue4,
                  onChanged: onChanged ?? (value) {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}
