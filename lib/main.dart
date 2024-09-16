import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_379/application.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) {
            return const Application();
          },
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}
