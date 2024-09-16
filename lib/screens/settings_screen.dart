import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/screens/screens.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(23.h),
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              AppTheme.blueGradient.createShader(bounds),
          child: Text(
            "Settings",
            style: AppTextStyles.bold48,
            textAlign: TextAlign.center,
          ),
        ),
        Gap(24.h),
        const CustomButton2(text: 'Privacy Policy'),
        Gap(12.h),
        const CustomButton2(text: 'Terms of Use'),
        Gap(12.h),
        CustomButton2(
          text: 'Subscription management',
          onTap: () => onTapPremium(context),
        ),
        Gap(12.h),
        const CustomButton2(text: 'Notification', hasSwitcher: true),
      ],
    );
  }

  void onTapPremium(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => const PaywallSheet(),
    );
  }
}
