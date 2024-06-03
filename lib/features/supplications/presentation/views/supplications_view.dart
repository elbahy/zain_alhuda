import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class SupplicationsView extends StatelessWidget {
  const SupplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأدعية'),
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
        child: Text('Supplications View'),
      ),
    );
  }
}
