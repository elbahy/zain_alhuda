import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_surah%20number_to_name.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class QuranAppBar extends StatelessWidget {
  const QuranAppBar({
    super.key,
    required this.ayahJuz,
    required this.suraNum,
  });

  final int ayahJuz;
  final int suraNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('الجزء ${convertToArabicRank(ayahJuz)}',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: AppStyles.elmisri500Size16
                  .copyWith(color: AppColors.primaryColor)),
          Text(convertSurahNumberToName(suraNum),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: AppStyles.quranSurah500Size80.copyWith(fontSize: 70)),
        ],
      ),
    );
  }
}
