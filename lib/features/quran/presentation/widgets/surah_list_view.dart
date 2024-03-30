import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/functions/convert_surah%20number_to_name.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
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
        if (state is GetQuranLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetQuranFailure) {
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
        } else if (state is GetQuranSuccess) {
          List<Datum> quranData = state.quranModel.data;

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
            itemCount: quranData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  GoRouter.of(context)
                      .push('/quran', extra: quranData[index].ayahs.first.page);
                },
                leading: Stack(children: [
                  SvgPicture.asset(
                    Assets.assetsImagesSurahNum,
                    color: AppColors.primaryColor,
                    width: 50,
                  ),
                  Positioned(
                    right: quranData[index].number < 10 ? 21 : 16,
                    top: 15,
                    child: Text(
                      quranData[index].number.toString(),
                      style: AppStyles.elmisri700Size18.copyWith(
                        fontSize: quranData[index].number < 100 ? 14 : 12,
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
                  'عدد اياتها  ${quranData[index].ayahs.length.toString()}',
                  style: AppStyles.elmisri500Size16
                      .copyWith(color: AppColors.thirdColor, fontSize: 12),
                ),
                trailing: quranData[index].revelationType == 'مكية'
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
