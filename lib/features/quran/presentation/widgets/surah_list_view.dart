import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/functions/convert_surah_number_to_name.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/functions/get_surah_page_number.dart';
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
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => current is GetSurahListSuccess || current is GetSurahListFailure || current is GetSurahListLoading,
      builder: (context, state) {
        if (state is GetSurahListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSurahListFailure) {
          return AlertDialog(
            title: Text(S.of(context).anerroroccurred),
            content: Text(state.errorMessage),
            actions: [
              TextButton.icon(
                onPressed: () {
                  CustomeNavigate.replace(context, '/');
                },
                icon: const Icon(Icons.home_filled),
                label: const Text("الذهاب للرئيسية"),
              ),
            ],
          );
        } else if (state is GetSurahListSuccess) {
          List<SurahListDataModel> surahData = state.surahList.data;

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
                onTap: () {
                  GoRouter.of(context).push('/quran', extra: getSurahPage(surahData[index].number));
                },
                leading: Stack(children: [
                  SvgPicture.asset(
                    Assets.assetsImagesSurahNum,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                    width: 50,
                  ),
                  Positioned(
                    right: surahData[index].number < 10 ? 21 : 16,
                    top: 15,
                    child: Text(
                      surahData[index].number.toString(),
                      style: AppStyles.elmisri700Size18.copyWith(
                        fontSize: surahData[index].number < 100 ? 14 : 12,
                      ),
                    ),
                  )
                ]),
                minVerticalPadding: 0,
                title: Text(
                  convertSurahNumberToName(index + 1),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: AppStyles.quranSurah500Size80,
                ),
                subtitle: Text(
                  'عدد اياتها  ${surahData[index].numberOfAyahs.toString()}',
                  style: AppStyles.elmisri500Size16.copyWith(color: AppColors.thirdColor, fontSize: 12),
                ),
                trailing: surahData[index].revelationType == 'Meccan'
                    ? SvgPicture.asset(
                        Assets.assetsImagesKaaba,
                        width: 40,
                        colorFilter: const ColorFilter.mode(AppColors.thirdColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        Assets.assetsImagesProphetMosque,
                        width: 40,
                        colorFilter: const ColorFilter.mode(AppColors.thirdColor, BlendMode.srcIn),
                      ),
                isThreeLine: true,
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
