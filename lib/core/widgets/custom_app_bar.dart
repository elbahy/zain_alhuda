import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
    this.screenName, {
    super.key,
    this.actions,
  });

  final String screenName;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: AppBar(
        title: Text(
          screenName,
          style:
              AppStyles.elmisri700Size18.copyWith(color: AppColors.thirdColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        actions: actions,
      ),
    );
  }
}
