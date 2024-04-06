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
                icon: Assets.assetsImagesQuranIcon,
                text: S.of(context).Quran,
                routName: '/surahList'),
            MenuItem(
                icon: Assets.assetsImagesEzkarIcon,
                text: S.of(context).azkar,
                routName: '/azkar'),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(
                icon: Assets.assetsImagesMosqueIcon,
                text: S.of(context).prayertimes,
                routName: '/prayerTimes'),
            MenuItem(
                icon: Assets.assetsImagesDoaaIcon,
                text: S.of(context).supplications,
                routName: '/supplications'),
          ],
        ),
      ],
    );
  }
}
