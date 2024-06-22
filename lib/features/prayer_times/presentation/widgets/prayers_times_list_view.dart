import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_time_to_12_hour.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class PrayersTimesList extends StatelessWidget {
  const PrayersTimesList({
    super.key,
    required this.pageController,
    required this.prayers,
    required this.adhanDataMonth,
    required this.pageController2,
  });

  final PageController pageController;
  final List<Map<String, dynamic>> prayers;
  final List adhanDataMonth;
  final PageController pageController2;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return ListView.builder(
          itemCount: prayers.length,
          itemBuilder: (context, index2) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                leading: Icon(prayers[index2]['icon'], color: AppColors.primaryColor),
                title: Text(
                  prayers[index2]['ar'],
                  style: AppStyles.elmisri700Size18,
                ),
                trailing: Text(
                  convertTimeTo12HourWithPeriod(adhanDataMonth[index].timings.toJson()[prayers[index2]['en']].toString()),
                  style: AppStyles.elmisri700Size18,
                ),
                tileColor: AppColors.secondColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            );
          },
        );
      },
      onPageChanged: (value) => pageController2.animateToPage(value, duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn),
    );
  }
}
