import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _health = 3;

  double _score1 = 0;
  double _score2 = 0;

  double _angle1 = 0;
  double _angle2 = 0;

  Timer? _timer;
  Timer? _debounce1;
  Timer? _debounce2;

  bool _falling1 = false;
  bool _falling2 = false;

  int _count1 = 2;
  int _count2 = 2;

  double _d = 0.003;

  int temp = 0;

  bool paused = false;

  final images = [
    'assets/png/toy1.png',
    'assets/png/toy2.png',
    'assets/png/toy3.png',
    'assets/png/toy4.png',
  ];

  @override
  void initState() {
    images.shuffle();
    super.initState();
    onInit();
  }

  void onInit() {
    onDebounce1();
    onDebounce2();
    temp = 0;
    onStart(false);
  }

  void onDebounce1({bool? cont}) {
    if (paused) return;
    if (_count1 < 4 && !(cont ?? false)) _count1++;
    _falling1 = false;
    if (_debounce1?.isActive ?? false) _debounce1?.cancel();
    _debounce1 = Timer(
      Duration(seconds: _count1),
      () {
        _falling1 = true;
        _count1 = 0;
      },
    );
  }

  void onDebounce2({bool? cont}) {
    if (paused) return;
    if (_count2 < 4 && !(cont ?? false)) _count2++;
    _falling2 = false;
    if (_debounce2?.isActive ?? false) _debounce2?.cancel();
    _debounce2 = Timer(
      Duration(seconds: _count2),
      () {
        _falling2 = true;
        _count2 = 0;
      },
    );
  }

  void onStart(bool cont) {
    if (cont) {
      onDebounce1(cont: true);
      onDebounce2(cont: true);
    }

    _timer = Timer.periodic(
      Duration(milliseconds: 10),
      (timer) {
        if (paused) return;
        temp += 10;

        if (temp == 500) {
          temp = 0;
          _score1 += cos(_angle1);
          _score2 += cos(_angle2);
        }

        if (_falling1) {
          final right = Random().nextBool();

          if (right) _angle1 += _d;
          if (!right) _angle1 -= _d;

          if (_angle1 < 0) _angle1 -= _d;
          if (_angle1 > 0) _angle1 += _d;

          if (_angle1 > pi / 3 || _angle1 < -pi / 3) {
            _angle1 = 0;
            _health--;
            if (_health < 1) {
              onLose();
              return;
            }
          }
        } else {
          if (_angle1 < 0) _angle1 += _d;
          if (_angle1 > 0) _angle1 -= _d;
        }

        if (_falling2) {
          final right = Random().nextBool();

          if (right) _angle2 += _d;
          if (!right) _angle2 -= _d;

          if (_angle2 < 0) _angle2 -= _d;
          if (_angle2 > 0) _angle2 += _d;

          if (_angle2 > pi / 3 || _angle2 < -pi / 3) {
            _angle2 = 0;
            _health--;
            if (_health < 1) {
              onLose();
              return;
            }
          }
        } else {
          if (_angle2 < 0) _angle2 += _d;
          if (_angle2 > 0) _angle2 -= _d;
        }

        setState(() {});
      },
    );
  }

  void onPause() {
    paused = !paused;

    if (!paused) {
      onStart(true);
      return;
    }

    _debounce1?.cancel();
    _debounce2?.cancel();
    _timer?.cancel();
    _timer = null;

    setState(() {});
  }

  void onLose() {
    onPause();
    showResults();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _debounce1?.cancel();
    _debounce2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Gap(23.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(left: index != 0 ? 12.w : 0),
                  child: Image.asset(
                    index < _health
                        ? 'assets/png/icons/heart1.png'
                        : 'assets/png/icons/heart0.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                );
              },
            ),
          ),
          Gap(71.h),
          SizedBox(
            width: 375.w,
            height: 168.h,
            child: Stack(
              children: [
                Positioned(
                  left: 40.w,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${_score1.toInt()}', style: AppTextStyles.bold24),
                      GestureDetector(
                        onTap: onDebounce1,
                        child: Transform.rotate(
                          angle: _angle1,
                          child: Image.asset(
                            images[0],
                            width: 124.w,
                            height: 124.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(43.h),
          SizedBox(
            width: 375.w,
            height: 168.h,
            child: Stack(
              children: [
                Positioned(
                  right: 40.w,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${_score2.toInt()}', style: AppTextStyles.bold24),
                      GestureDetector(
                        onTap: onDebounce2,
                        child: Transform.rotate(
                          angle: _angle2,
                          child: Image.asset(
                            images[1],
                            width: 124.w,
                            height: 124.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          PauseButton(paused: paused, onTap: onPause),
          Gap(19.h),
        ],
      ),
    );
  }

  void showResults() {
    final score = (_score1 + _score2).toInt();
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierColor: Color(0xFFD9D9D9).withOpacity(0.01),
      builder: (context) => ResultDialog(score: score),
    );
  }
}
