import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_379/application.dart';
import 'package:id_379/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

ValueNotifier<bool> premium = ValueNotifier(false);
ValueNotifier<bool> notification = ValueNotifier(true);

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await NotificationService().init();

      preferences = await SharedPreferences.getInstance();

      premium.value = preferences.getBool('PREMIUM') ?? false;
      notification.value = preferences.getBool('NOTIFICATION') ?? true;

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

void buyPremium() {
  preferences.setBool('PREMIUM', true);
  premium.value = true;
}

void enableNotification() {
  notification.value = !notification.value;
  preferences.setBool('NOTIFICATION', notification.value);
}
