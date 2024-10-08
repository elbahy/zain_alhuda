import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.isMainItem = true,
  });
  final String label;
  final Function() onPressed;
  final Widget icon;
  final bool isMainItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isMainItem ? 10 : 4),
      height: isMainItem ? 60 : 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isMainItem ? Colors.white : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: onPressed,
            label: Text(
              label,
              style: isMainItem
                  ? AppStyles.elmisri700Size18
                  : AppStyles.elmisri500Size16.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
            ),
            icon: icon,
          ),
          isMainItem
              ? const Icon(Icons.arrow_forward_ios_outlined,
                  color: AppColors.primaryColor)
              : const SizedBox()
        ],
      ),
    );
  }
}
