import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key, required this.monthNo, required this.monthAr});

  final String monthNo, monthAr;

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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: PrayerTimesCubit.get(context).selectedMonth == monthNo ? AppColors.primaryColor : AppColors.thirdColor,
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
    );
  }
}
