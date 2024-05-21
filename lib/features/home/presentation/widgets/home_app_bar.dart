import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  static final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: AppBar(
        actions: [
          Builder(builder: (context) {
            return IconButton(
                icon: SvgPicture.asset(
                  Assets.assetsImagesMenu,
                  colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                  width: 40,
                ),
                onPressed: () {
                  scafoldKey.currentState!.openEndDrawer();
                });
          }),
        ],
        leading: Image.asset(Assets.assetsImagesApplogo),
      ),
    );
  }
}
