import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/quran_app_bar.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/quran_bottom_sheet.dart';

class QuranView extends StatelessWidget {
  const QuranView({
    super.key,
    required this.page,
  });

  final int page;

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    // تغيير لون الخلفية في الشريط العلوي
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: AppColors.primaryColor, // لون الخلفية الجديد
    // ));

    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is GetQuranSuccess
              ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return const QuranBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppColors.primaryColor,
                      AppColors.thirdColor
                    ])),
                    child: PageView.builder(
                      controller: PageController(initialPage: page - 1),
                      itemBuilder: (_, index) {
                        List<Datum> quranData = state.quranModel.data;
                        Datum suraName = quranData.firstWhere((element) =>
                            element.ayahs
                                .any((Ayah) => Ayah.page == index + 1));
                        Ayah ayah = suraName.ayahs
                            .firstWhere((element) => element.page == index + 1);
                        getIt<CacheHelper>()
                            .saveData(key: 'lastQuranPage', value: index + 1);
                        getIt<CacheHelper>().saveData(
                            key: 'lastSurahNum', value: suraName.number);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 10),
                            QuranAppBar(
                              ayahJuz: ayah.juz,
                              suraNum: suraName.number,
                              pageNum: index + 1,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .9,
                              decoration: const BoxDecoration(
                                color: AppColors.secondColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/page${index + 1}.png',
                                    height: MediaQuery.of(context).size.height *
                                        .85,
                                  ),
                                  Text(
                                    convertNumberToArabic(index + 1),
                                    style: AppStyles.elmisri700Size18.copyWith(
                                        fontSize: 16,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: 604,
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
