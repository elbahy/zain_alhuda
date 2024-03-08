import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  static final GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Builder(builder: (context) {
          return IconButton(
              icon: SvgPicture.asset(
                Assets.assetsImagesMenu,
                color: AppColors.primaryColor,
                width: 40,
              ),
              onPressed: () {
                scafoldKey.currentState!.openEndDrawer();
              });
        }),
      ],
      leading: Image.asset(Assets.assetsImagesApplogo),
    );
  }
}
