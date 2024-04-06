import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_surah%20number_to_name.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';

class QuranAppBar extends StatelessWidget {
  const QuranAppBar({
    super.key,
    required this.ayahJuz,
    required this.suraNum,
    required this.pageNum,
  });

  final int ayahJuz;
  final int suraNum;
  final int pageNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('الجزء ${convertToArabicRank(ayahJuz)}',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: AppStyles.elmisri500Size16
                  .copyWith(color: AppColors.primaryColor)),
          Text(convertSurahNumberToName(suraNum),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: AppStyles.quranSurah500Size80.copyWith(fontSize: 70)),
          BlocConsumer<QuranAppBarCubit, QuranAppBarState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<QuranAppBarCubit>(context)
                        .bookmarkPage(pageNum);

                    print(getIt<CacheHelper>().getData(key: 'bookmarkPage'));
                  },
                  icon: Icon(
                      getIt<CacheHelper>().getData(key: 'bookmarkPage') ==
                              pageNum
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined));
            },
          )
        ],
      ),
    );
  }
}
