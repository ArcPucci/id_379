import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_379/main.dart';
import 'package:id_379/utils/utils.dart';
import 'package:id_379/widgets/buttons/custom_button_1.dart';

class PaywallSheet extends StatelessWidget {
  const PaywallSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 730.h,
      child: Material(
        color: AppTheme.black,
        child: Stack(
          children: [
            Positioned.fill(
              top: 44.h,
              child: Image.asset('assets/png/paywall.png', fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    SizedBox(
                      width: 375.w,
                      height: 44.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text('Subscription', style: AppTextStyles.bold18),
                          Positioned(
                            left: 8.w,
                            child: GestureDetector(
                              onTap: Navigator.of(context).pop,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/png/icons/back.png',
                                    width: 17.w,
                                    height: 22.h,
                                  ),
                                  Gap(3.w),
                                  Text('Back', style: AppTextStyles.medium17),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) =>
                              AppTheme.blueGradient.createShader(bounds),
                          child: Text(
                            "Enjoy\nwithout\nads!",
                            style: AppTextStyles.extraBold56,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    CustomButton1(
                      width: 137.w,
                      text: 'Get for \$0.49',
                      onTap: () => onBuyPremium(context),
                    ),
                    Gap(24.h),
                    GestureDetector(
                      onTap: () => onBuyPremium(context),
                      child: Text('Restore', style: AppTextStyles.medium16),
                    ),
                    Gap(16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onBuyPremium(BuildContext context) {
    Navigator.of(context).pop();
    buyPremium();
  }
}
