import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class AppStyles {
  static const TextStyle elmisri400Size30 = TextStyle(
      fontSize: 30,
      fontFamily: 'NotoKufi',
      fontWeight: FontWeight.w400,
      color: AppColors.secondColor);

  static const TextStyle elmisri700Size18 = TextStyle(
      fontSize: 18,
      fontFamily: 'NotoKufi',
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor);

  static const TextStyle quranSurah500Size80 = TextStyle(
      fontSize: 80,
      fontFamily: 'QuranSurah',
      fontWeight: FontWeight.w100,
      height: .5,
      color: AppColors.primaryColor);

  static const TextStyle elmisri500Size16 = TextStyle(
      color: Colors.grey,
      fontFamily: 'NotoKufi',
      fontSize: 16,
      fontWeight: FontWeight.w500);
}
