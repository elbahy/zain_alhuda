import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Assets.assetsImagesApplogo, width: 200)),
            const Divider(
              color: AppColors.primaryColor,
              height: 75,
              thickness: .5,
            ),
            DrawerListItem(
              itemName: 'الإنتقال الى العلامة',
              onPressed: () {},
              icon: const Icon(Icons.bookmark_outlined,
                  color: AppColors.primaryColor, size: 30),
            ),
            DrawerListItem(
              itemName: 'دعاء ختم القرآن',
              onPressed: () {},
              icon: Image.asset(Assets.assetsImagesOnboardingDoaa, width: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    required this.itemName,
    required this.onPressed,
    required this.icon,
  });
  final String itemName;
  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: onPressed,
            label: Text(
              itemName,
              style: AppStyles.elmisri700Size18,
            ),
            icon: icon,
          ),
          const Icon(Icons.arrow_forward_ios_outlined,
              color: AppColors.primaryColor)
        ],
      ),
    );
  }
}
