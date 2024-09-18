import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.child, required this.path});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final hasGradient = (path == '/pre_game/game');
    return Material(
      color: AppTheme.black,
      child: Container(
        decoration: BoxDecoration(
          gradient: hasGradient
              ? LinearGradient(
                  colors: [
                    Color(0xFF334856),
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: SafeArea(
          top: !hasGradient,
          child: Stack(
            children: [
              Positioned.fill(bottom: 64.h, child: child),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(child: CustomBottomBar(path: path)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
