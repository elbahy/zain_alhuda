import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key, required this.monthNo, required this.monthAr, required this.selectedMonth, required this.pageController1, required this.pageController2});

  final String monthNo, monthAr, selectedMonth;

  static final List<Map<String, String>> months = [
    {'no': '01', 'en': 'January', 'ar': 'يناير'},
    {'no': '02', 'en': 'February', 'ar': 'فبراير'},
    {'no': '03', 'en': 'March', 'ar': 'مارس'},
    {'no': '04', 'en': 'April', 'ar': 'ابريل'},
    {'no': '05', 'en': 'May', 'ar': 'مايو'},
    {'no': '06', 'en': 'June', 'ar': 'يونيو'},
    {'no': '07', 'en': 'July', 'ar': 'يوليو'},
    {'no': '08', 'en': 'August', 'ar': 'اغسطس'},
    {'no': '09', 'en': 'September', 'ar': 'سبتمبر'},
    {'no': '10', 'en': 'October', 'ar': 'اكتوبر'},
    {'no': '11', 'en': 'November', 'ar': 'نوفمبر'},
    {'no': '12', 'en': 'December', 'ar': 'ديسمبر'},
  ];
  final PageController pageController1;
  final PageController pageController2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PrayerTimesCubit.get(context).changeSelectedMonth(monthNo);
        pageController1.jumpTo(1);
        pageController2.jumpTo(1);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedMonth == monthNo ? AppColors.primaryColor : AppColors.thirdColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              monthNo,
              style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor),
            ),
            Text(monthAr, style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor)),
          ],
        ),
      ),
    );
  }
}
