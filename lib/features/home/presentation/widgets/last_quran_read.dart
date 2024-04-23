import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_surah%20number_to_name.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class LastQuranRead extends StatefulWidget {
  const LastQuranRead({
    super.key,
  });

  @override
  State<LastQuranRead> createState() => _LastQuranReadState();
}

class _LastQuranReadState extends State<LastQuranRead> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomeNavigate.navigate(context, '/quran', extra: getIt<CacheHelper>().getData(key: 'lastQuranPage'), then: (value) {
          setState(() {});
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            const Text('اخر تلاوه', style: AppStyles.elmisri700Size18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  convertSurahNumberToName(getIt<CacheHelper>().getData(key: 'lastSurahNum')),
                  style: AppStyles.quranSurah500Size80,
                ),
                Text(
                  'صفحة ${convertNumberToArabic(getIt<CacheHelper>().getData(key: 'lastQuranPage'))}',
                  style: AppStyles.elmisri500Size16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
