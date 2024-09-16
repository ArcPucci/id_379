import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;

class CustomCircleIndicator extends StatefulWidget {
  const CustomCircleIndicator({
    super.key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  }) : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
              !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        );

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<CustomCircleIndicator> createState() => _CustomCircleIndicatorState();
}

class _CustomCircleIndicatorState extends State<CustomCircleIndicator>
    with SingleTickerProviderStateMixin {
  static const _itemCount = 8;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_itemCount, (index) {
            final position = widget.size * 0.5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform: Matrix4.rotationZ(45.0 * index * 0.0174533),
                child: Align(
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: DelayTween(
                      begin: 0.0,
                      end: 1.0,
                      delay: index / _itemCount,
                    ).animate(_controller),
                    child: Transform.rotate(
                      angle: math.pi * 3 / 4,
                      child: Container(
                        width: 6,
                        height: 17,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
