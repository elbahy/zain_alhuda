import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetSurahLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSurahFailure) {
          return AlertDialog(
            title: Text(S.of(context).anerroroccurred),
            content: Text(state.errorMessage),
            actions: [
              TextButton.icon(
                onPressed: () {
                  GoRouter.of(context).pushReplacement('/');
                },
                icon: const Icon(Icons.home_filled),
                label: const Text("الذهاب للرئيسية"),
              ),
            ],
          );
        } else if (state is GetSurahSuccess) {
          List<SurahDataModel> surahData = state.surahModel.data;

          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.primaryColor,
                height: 3,
                thickness: .3,
                endIndent: 25,
                indent: 25,
              );
            },
            itemCount: surahData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Stack(children: [
                  SvgPicture.asset(
                    Assets.assetsImagesSurahNum,
                    color: AppColors.primaryColor,
                    width: 50,
                  ),
                  Positioned(
                    right: 20,
                    top: 12,
                    child: Text(
                      convertToArabicNumber(surahData[index].number.toString()),
                      style: AppStyles.elmisri700Size20.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  )
                ]),
                title: Text(
                  surahData[index].name,
                  style: AppStyles.elmisri700Size20.copyWith(fontSize: 18),
                ),
                subtitle: Text(
                  'عدد اياتها  ${convertToArabicNumber(surahData[index].numberOfAyahs.toString())}',
                  style: AppStyles.elmisri500Size16
                      .copyWith(color: AppColors.thirdColor, fontSize: 14),
                ),
                trailing: surahData[index].revelationType == 'Meccan'
                    ? SvgPicture.asset(
                        Assets.assetsImagesKaaba,
                        width: 40,
                        color: AppColors.thirdColor,
                      )
                    : SvgPicture.asset(
                        Assets.assetsImagesProphetMosque,
                        width: 40,
                        color: AppColors.thirdColor,
                      ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
