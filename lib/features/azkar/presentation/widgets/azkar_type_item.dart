import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class AzkarTypeItem extends StatelessWidget {
  const AzkarTypeItem({
    super.key,
    required this.azkarType,
    this.onTap,
  });

  final String azkarType;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.only(top: 30),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          // border: Border.all(width: 1, color: AppColors.primaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              azkarType,
              style: AppStyles.elmisri700Size18,
            ),
            SvgPicture.asset(
              Assets.assetsImagesEzkarIcon,
              width: 50,
              colorFilter: const ColorFilter.mode(AppColors.thirdColor, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
