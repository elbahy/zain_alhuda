import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/menu_item.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(
                icon: Assets.assetsImagesQuranIcon, text: S.of(context).Quran),
            MenuItem(
                icon: Assets.assetsImagesEzkarIcon, text: S.of(context).azkar),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(
                icon: Assets.assetsImagesMosqueicon,
                text: S.of(context).prayertimes),
            MenuItem(
                icon: Assets.assetsImagesDoaaIcon,
                text: S.of(context).supplications),
          ],
        ),
      ],
    );
  }
}
