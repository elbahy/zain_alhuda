import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class AppBarSpace extends StatelessWidget {
  const AppBarSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.thirdColor],
        ),
        image: DecorationImage(image: AssetImage(Assets.assetsImagesAppBarBg), fit: BoxFit.cover),
      ),
    );
  }
}
