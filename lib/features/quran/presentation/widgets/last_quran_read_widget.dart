import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class LastQuranReadWidget extends StatefulWidget {
  const LastQuranReadWidget({
    super.key,
  });

  @override
  State<LastQuranReadWidget> createState() => _LastQuranReadWidgetState();
}

class _LastQuranReadWidgetState extends State<LastQuranReadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: AssetImage(Assets.assetsImagesLastReadQuran),
          fit: BoxFit.cover,
          opacity: .3,
        ),
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.thirdColor],
          end: FractionalOffset(.5, 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'التلاوة الأخيرة',
              style: AppStyles.elmisri700Size18
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              convertSurahNumberToName(
                  getIt<CacheHelper>().getData(key: 'lastSurahNum') ?? 1),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: AppStyles.quranSurah500Size80.copyWith(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
            Text(
              ' الآية رقم ${convertNumberToArabic(getIt<CacheHelper>().getData(key: 'lastAyahNum') ?? 1)}',
              style: AppStyles.elmisri500Size16
                  .copyWith(color: Colors.white, fontSize: 12),
            ),
          ]),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondColor),
            onPressed: () {
              CustomeNavigate.navigate(context, '/quran',
                  extra: getIt<CacheHelper>().getData(key: 'lastQuranPage') ??
                      1, then: (value) {
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColors.primaryColor,
            ),
            label: const Text(
              'إستمرار',
              style: AppStyles.elmisri700Size18,
            ),
          )
        ],
      ),
    );
  }
}
