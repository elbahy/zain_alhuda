import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                onTap: () {
                  GoRouter.of(context).push('/surahList');
                }),
            MenuItem(
                icon: Assets.assetsImagesEzkarIcon,
                text: S.of(context).azkar,
                onTap: () {
                  GoRouter.of(context).push('/azkar');
                }),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(
                icon: Assets.assetsImagesMosqueIcon,
                text: S.of(context).prayertimes,
                onTap: () {
                  GoRouter.of(context).push('/prayerTimes');
                }),
            MenuItem(
                icon: Assets.assetsImagesDoaaIcon,
                text: S.of(context).supplications,
                onTap: () {
                  GoRouter.of(context).push('/supplications');
                }),
          ],
        ),
      ],
    );
  }
}
