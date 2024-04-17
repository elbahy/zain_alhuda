import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/convert_number_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_prayer_name_to_arabic.dart';
import 'package:zain_alhuda/core/functions/convert_weekday_to_arabic.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/home/data/models/adhan_model.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_state.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/prayer_time_list_item.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String nextPraying = '';
    DateTime nextPrayerTime = DateTime(9999);
    final prayersToCompare = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha']; // الصلوات التي تريد المقارنة معها
    Timings? timings;
    Hijri? hijri;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetAdhanTodayFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
          ));
        }

        if (state is GetAdhanTodaySuccess) {
          timings = state.adhanToday.data!.timings!;
          hijri = state.adhanToday.data!.date!.hijri!;
          timings!.toJson().forEach((prayer, time) {
            if (prayersToCompare.contains(prayer)) {
              final prayerTime = DateTime(
                currentTime.year,
                currentTime.month,
                currentTime.day,
                int.parse(time.split(":")[0]),
                int.parse(time.split(":")[1]),
              );

              if (currentTime.isBefore(prayerTime) && prayerTime.isBefore(nextPrayerTime)) {
                nextPrayerTime = prayerTime;
                nextPraying = prayer;
              }
            }
          });

          return;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    opacity: .3,
                    image: AssetImage(Assets.assetsImagesMosqueBg),
                  ),
                  color: AppColors.primaryColor,
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.thirdColor],
                    end: FractionalOffset(2.0, 0.0),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: state is GetAdhanTodaySuccess
                  ? Column(
                      children: [
                        Text(
                          ' ${hijri!.weekday!.ar} ${hijri!.day} ${hijri!.month!.ar} ${hijri!.year}',
                          style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'الصلاة القادمة ${convertPrayerNameToArabic(nextPraying)} ${timings!.toJson()[nextPraying]} ',
                          style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PrayerTimeListItem(
                              prayerTime: timings!.fajr!,
                              prayerName: 'الفجر',
                              icon: Icons.nightlight_round,
                              isNextPrayer: nextPraying == 'Dhuhr',
                            ),
                            PrayerTimeListItem(
                              prayerTime: timings!.sunrise!,
                              prayerName: 'الشروق',
                              icon: Icons.wb_sunny,
                            ),
                            PrayerTimeListItem(
                              prayerTime: timings!.dhuhr!,
                              prayerName: 'الظهر',
                              icon: Icons.brightness_high,
                              isNextPrayer: nextPraying == 'Asr',
                            ),
                            PrayerTimeListItem(
                              prayerTime: timings!.asr!,
                              prayerName: 'العصر',
                              icon: Icons.wb_twilight,
                              isNextPrayer: nextPraying == 'Maghrib',
                            ),
                            PrayerTimeListItem(
                              prayerTime: timings!.maghrib!,
                              prayerName: 'المغرب',
                              icon: Icons.brightness_6,
                              isNextPrayer: nextPraying == 'Isha',
                            ),
                            PrayerTimeListItem(
                              prayerTime: timings!.isha!,
                              prayerName: 'العشاء',
                              icon: Icons.nights_stay,
                              isNextPrayer: nextPraying == 'Fajr',
                            ),
                          ],
                        )
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.secondColor,
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
