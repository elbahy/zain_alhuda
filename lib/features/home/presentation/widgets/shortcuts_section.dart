import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_shortcut_item.dart';

class ShortcutsSection extends StatefulWidget {
  const ShortcutsSection({
    super.key,
  });

  @override
  State<ShortcutsSection> createState() => _ShortcutsSectionState();
}

class _ShortcutsSectionState extends State<ShortcutsSection> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ShortcutItem(
        title: 'التلاوة الأخيرة',
        onTap: () {
          CustomeNavigate.navigate(context, '/quran',
              extra: getIt<CacheHelper>().getData(key: 'lastQuranPage') ?? 1,
              then: (value) {
            setState(() {});
          });
        },
        bgImage: Assets.assetsImagesLastReadQuran,
        text: Text(
          convertSurahNumberToName(
              getIt<CacheHelper>().getData(key: 'lastSurahNum') ?? 1),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.right,
          style: AppStyles.quranSurah500Size80.copyWith(
            color: Colors.white,
            fontSize: 80,
          ),
        ),
      ),
      ShortcutItem(
        title: 'عداد الأذكار',
        bgImage: Assets.assetsImagesAzkarBg,
        text: Text(
          '${getIt<CacheHelper>().getData(key: 'azkarFinished') ?? 0} ذكر',
          style: AppStyles.elmisri700Size18
              .copyWith(fontSize: 24, color: AppColors.secondColor),
        ),
        onTap: () {
          CustomeNavigate.navigate(context, '/azkar', then: (value) {
            setState(() {});
          });
        },
      )
    ]);
  }
}
