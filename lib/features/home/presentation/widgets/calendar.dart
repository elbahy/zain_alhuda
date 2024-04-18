import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/convert_prayer_name_to_arabic.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/home/data/models/adhan_model.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_state.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/next_praying_timer.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/prayer_time_list.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late Timings timings;
    late Hijri hijri;

    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state is GetAdhanTodayFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
          ));
        }

        if (state is GetAdhanTodaySuccess) {
          timings = state.adhanToday.data.timings;
          hijri = state.adhanToday.data.date.hijri;
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
                          ' ${hijri.weekday.ar} ${hijri.day} ${hijri.month.ar} ${hijri.year} هـ',
                          style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'صلاة ${convertPrayerNameToArabic(cubit.nextPraying)}  بعد',
                              style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor),
                            ),
                            PrayerCountdown(prayerTime: timings.toJson()[cubit.nextPraying]!)
                          ],
                        ),
                        const SizedBox(height: 10),
                        PrayerTimeList(timings: timings, nextPraying: cubit.nextPraying),
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
