import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/quran_bottom_sheet.dart';

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
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return const QuranBottomSheet();
                    },
                  );
                },
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.secondColor,
                  size: 30,
                ),
              ),
              BlocConsumer<QuranAppBarCubit, QuranAppBarState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        BlocProvider.of<QuranAppBarCubit>(context).bookmarkPage(pageNum);
                      },
                      icon: Icon(
                        getIt<CacheHelper>().getData(key: 'bookmarkPage') == pageNum ? Icons.bookmark : Icons.bookmark_add_outlined,
                        color: AppColors.secondColor,
                        size: 30,
                      ));
                },
              ),
            ],
          ),
          Text(convertSurahNumberToName(suraNum), textDirection: TextDirection.ltr, textAlign: TextAlign.right, style: AppStyles.quranSurah500Size80.copyWith(fontSize: 70, color: AppColors.secondColor)),
          Text('الجزء ${convertToArabicRank(ayahJuz)}', textDirection: TextDirection.ltr, textAlign: TextAlign.right, style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor)),
        ],
      ),
    );
  }
}
