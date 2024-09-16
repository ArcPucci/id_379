import 'package:flutter/material.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.child, required this.path});

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.black,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: child),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(child: CustomBottomBar(path: path)),
            ),
          ],
        ),
      ),
    );
  }
}
