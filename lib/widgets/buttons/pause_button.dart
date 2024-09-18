import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({super.key, required this.paused, this.onTap});

  final bool paused;
  final void Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(!paused),
      child: Container(
        width: 123.w,
        height: 40.h,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            width: 2.sp,
            gradient: LinearGradient(
              colors: [Color(0xFF004B99), Colors.white],
            ),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    if (paused)
      return Image.asset(
        'assets/png/icons/play.png',
        width: 24.w,
        height: 24.h,
      );
    return Image.asset(
      'assets/png/icons/pause.png',
      width: 12.w,
      height: 16.h,
    );
  }
}
