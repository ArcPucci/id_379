import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:id_379/utils/utils.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, required this.path});

  final String path;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final list = <_BottomBarItem>[
    _BottomBarItem(
      id: 0,
      title: 'About',
      icon: 'assets/png/icons/book0.png',
      enabledIcon: 'assets/png/icons/book1.png',
      path: '/',
    ),
    _BottomBarItem(
      id: 0,
      title: 'Game',
      icon: 'assets/png/icons/game0.png',
      enabledIcon: 'assets/png/icons/game1.png',
      path: '/pre_game',
    ),
    _BottomBarItem(
      id: 0,
      title: 'Settings',
      icon: 'assets/png/icons/settings0.png',
      enabledIcon: 'assets/png/icons/settings1.png',
      path: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _index = getSelected();
    return Container(
      width: 182.w,
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          list.length,
          (index) {
            final item = list[index];
            final selected = index == _index;
            return GestureDetector(
              onTap: () => context.go(item.path),
              child: SizedBox(
                width: 34.w,
                height: 38.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      selected ? item.enabledIcon : item.icon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    FittedBox(
                      fit: BoxFit.none,
                      child: Text(item.title, style: AppTextStyles.medium8),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int getSelected() {
    for (var i = list.length - 1; i >= 0; i--) {
      if (widget.path.contains(list[i].path)) return i;
    }

    return 0;
  }
}

class _BottomBarItem {
  final int id;
  final String title;
  final String icon;
  final String enabledIcon;
  final String path;

  _BottomBarItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.enabledIcon,
    required this.path,
  });
}
