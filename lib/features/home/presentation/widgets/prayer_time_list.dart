import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/functions/convert_time_to_12_hour.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/prayer_time_list_item.dart';
import 'package:zain_alhuda/features/prayer_times/data/models/today_adhan_model.dart';

class PrayerTimeList extends StatelessWidget {
  const PrayerTimeList({
    super.key,
    required this.timings,
    required this.nextPraying,
  });

  final Timings timings;
  final String nextPraying;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.fajr),
          prayerName: 'الفجر',
          icon: Icons.nightlight_round,
          isNextPrayer: nextPraying == 'Dhuhr',
        ),
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.sunrise),
          prayerName: 'الشروق',
          icon: Icons.wb_sunny,
        ),
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.dhuhr),
          prayerName: 'الظهر',
          icon: Icons.brightness_high,
          isNextPrayer: nextPraying == 'Asr',
        ),
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.asr),
          prayerName: 'العصر',
          icon: Icons.wb_twilight,
          isNextPrayer: nextPraying == 'Maghrib',
        ),
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.maghrib),
          prayerName: 'المغرب',
          icon: Icons.brightness_6,
          isNextPrayer: nextPraying == 'Isha',
        ),
        PrayerTimeListItem(
          prayerTime: convertTimeTo12Hour(timings.isha),
          prayerName: 'العشاء',
          icon: Icons.nights_stay,
          isNextPrayer: nextPraying == 'Fajr',
        ),
      ],
    );
  }
}
