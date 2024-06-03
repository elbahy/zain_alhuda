import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.thirdColor],
            ),
            image: DecorationImage(image: AssetImage(Assets.assetsImagesAppBarBg), fit: BoxFit.cover),
          ),
        ),
      ),
      body: const Center(
        child: Text('Prayer Times View'),
      ),
    );
  }
}
