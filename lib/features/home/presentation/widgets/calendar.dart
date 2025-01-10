import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/convert_prayer_name_to_arabic.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/next_praying_timer.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/prayer_time_list.dart';
import 'package:zain_alhuda/features/prayer_times/data/models/today_adhan_model.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_state.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    Timings? timings;
    Hijri? hijri;
    Gregorian? gregorian;
    String timeZone;

    PrayerTimesCubit cubit = BlocProvider.of<PrayerTimesCubit>(context);

    return BlocConsumer<PrayerTimesCubit, PrayerTimesState>(
      listener: (context, state) async {
        if (state is GetAdhanTodaySuccess) {
          timings = state.todayAdhanToday.data.timings;
          hijri = state.todayAdhanToday.data.date.hijri;
          gregorian = state.todayAdhanToday.data.date.gregorian;
          timeZone = state.todayAdhanToday.data.meta.timezone;

          // getIt<LocalNotificationsService>().scheduleNotification(
          //   id: 1,
          //   title: 'الصلاة آلان',
          //   body: 'حان الان صلاة العصر',
          //   scheduledDate: tz.TZDateTime(
          //       tz.getLocation(timeZone),
          //       int.parse(gregorian!.year),
          //       gregorian!.month.number,
          //       int.parse(gregorian!.day),
          //       int.parse(timings!.isha.split(':').first),
          //       int.parse(timings!.isha.split(':').last)),
          //   playLoad: 'playLoad',
          // );

          // getIt<LocalNotificationsService>().scheduleNotification(
          //   id: 10,
          //   title: 'الصلاة آلان',
          //   body: 'حان الان صلاة العصر',
          //   scheduledDate:
          //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
          //   playLoad: 'playLoad',
          // );

          // showNotificationSettingsPrompt(context);
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
                        hijri != null
                            ? Text(
                                ' ${hijri?.weekday.ar} ${hijri?.day} ${hijri?.month.ar} ${hijri?.year} هـ',
                                style: AppStyles.elmisri500Size16
                                    .copyWith(color: AppColors.secondColor),
                              )
                            : const SizedBox(), // التحقق من عدم القيمة الغير متاحة,
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'صلاة ${convertPrayerNameToArabic(cubit.nextPraying)}  بعد',
                              style: AppStyles.elmisri500Size16
                                  .copyWith(color: AppColors.secondColor),
                            ),
                            timings != null
                                ? PrayerCountdown(
                                    prayerTime:
                                        timings?.toJson()[cubit.nextPraying],
                                    onCountdownFinished: () {
                                      setState(() {
                                        cubit.getLocation();
                                      });
                                    },
                                  )
                                : const SizedBox()
                          ],
                        ),
                        const SizedBox(height: 10),
                        timings != null
                            ? PrayerTimeList(
                                timings: timings!,
                                nextPraying: cubit.nextPraying)
                            : const SizedBox(),
                      ],
                    )
                  : state is GetAdhanTodayFailure
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const Icon(
                                Icons.wifi_off_sharp,
                                color: AppColors.secondColor,
                                size: 35,
                              ),
                              Text(
                                'يرجى الاتصال بالانترنت , لعرض مواعيد الصلاة',
                                style: AppStyles.elmisri500Size16
                                    .copyWith(color: AppColors.secondColor),
                              ),
                            ])
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

  void showNotificationSettingsPrompt(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تفعيل الإشعارات ذات الأولوية العالية"),
          content: const Text(
              "يرجى تفعيل الإشعارات ذات الأولوية العالية من إعدادات الهاتف لضمان عرض الإشعارات بملء الشاشة."),
          actions: <Widget>[
            TextButton(
              child: const Text("فتح الإعدادات"),
              onPressed: () {
                openNotificationSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("إلغاء"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void openNotificationSettings() async {
    const AndroidIntent intent = AndroidIntent(
      action: 'android.settings.action.MANAGE_OVERLAY_PERMISSION',
      arguments: <String, dynamic>{
        'android.provider.extra.APP_PACKAGE': 'com.example.zain_alhuda',
        ' package': 'com.example.zain_alhuda'
      },
    );
    await intent.launch();
  }
}
