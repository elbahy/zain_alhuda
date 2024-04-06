import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_weekday_to_arabic.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 200,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              gradient: const LinearGradient(
                colors: [AppColors.primaryColor, AppColors.thirdColor],
                end: FractionalOffset(2.0, 0.0),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  Text(getArabicWeekday(now.weekday),
                      style: AppStyles.elmisri400Size30),
                  Image.asset(Assets.assetsImagesIslamicCalender,
                      opacity: const AlwaysStoppedAnimation(0.5), width: 100)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${convertNumberToArabic(now.day)}-${convertNumberToArabic(now.month)}-${convertNumberToArabic(now.year)}',
                      style: AppStyles.elmisri400Size30)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
