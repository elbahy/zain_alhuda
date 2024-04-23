import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class JuzTextWidget extends StatelessWidget {
  const JuzTextWidget({super.key, required this.text, this.isHeader = false});

  final String text;
  final bool isHeader;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: AppStyles.elmisri500Size16.copyWith(
          color: isHeader ? AppColors.thirdColor : AppColors.primaryColor,
          fontSize: 14,
        ));
  }
}
