import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/widgets/widgets.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _health = 3;

  int _score1 = 0;
  int _score2 = 0;

  double _angle1 = pi / 2;
  double _angle2 = pi / 2;

  Timer? _timer;

  void onStart() {}

  void onPause() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(23.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.only(left: index != 0 ? 12.w : 0),
              child: Image.asset(
                'assets/png/icons/heart1.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ),
        Spacer(),
        PauseButton(paused: false),
        Gap(19.h),
      ],
    );
  }
}
