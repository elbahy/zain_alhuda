import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class PrayerTimeListItem extends StatelessWidget {
  const PrayerTimeListItem({
    super.key,
    required this.prayerTime,
    required this.prayerName,
    required this.icon,
    this.isNextPrayer = false,
  });

  final String prayerTime;
  final String prayerName;
  final IconData icon;
  final bool isNextPrayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: isNextPrayer ? AppColors.thirdColor : Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Text(prayerName, style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor, fontSize: 12)),
          Icon(
            icon,
            color: AppColors.secondColor,
            size: 30,
          ),
          Text(prayerTime, style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor, fontSize: 12)),
        ],
      ),
    );
  }
}
