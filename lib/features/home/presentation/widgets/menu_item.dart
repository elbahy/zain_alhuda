import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.routName,
  });

  final String icon, text, routName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomeNavigate.navigate(context, routName);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.secondColor),
              child: SvgPicture.asset(icon,
                  color: AppColors.thirdColor, width: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: AppStyles.elmisri700Size18),
                const Icon(Icons.arrow_forward, color: AppColors.primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
