import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/drawer_list_item.dart';

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
              label: 'الإنتقال الى العلامة',
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border_rounded,
                  color: AppColors.primaryColor, size: 30),
            ),
            DrawerListItem(
              label: 'دعاء ختم القرآن',
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.assetsImagesQuranIcon,
                width: 35,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 25),
            DrawerListItem(
              isMainItem: false,
              label: 'شارك التطبيق',
              onPressed: () {},
              icon: const Icon(Icons.share_outlined,
                  color: AppColors.primaryColor, size: 25),
            ),
            DrawerListItem(
              isMainItem: false,
              label: 'تواصل معنا',
              onPressed: () {},
              icon: const Icon(Icons.email_outlined,
                  color: AppColors.primaryColor, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
