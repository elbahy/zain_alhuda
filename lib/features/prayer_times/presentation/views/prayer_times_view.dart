import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/functions/get_month_adhan_data.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_state.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/widgets/date_slider_widget.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/widgets/month_selector.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/widgets/prayers_times_list_view.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
        initialPage: PrayerTimesCubit.get(context).selectedDay - 1);
    PageController pageController2 = PageController(
        initialPage: PrayerTimesCubit.get(context).selectedDay - 1);
    ScrollController scrollController = ScrollController();

    final List<Map<String, dynamic>> prayers = [
      {'ar': 'الفجر', 'en': 'Fajr', 'icon': Icons.wb_sunny},
      {'ar': 'الشروق', 'en': 'Sunrise', 'icon': Icons.brightness_5},
      {'ar': 'الظهر', 'en': 'Dhuhr', 'icon': Icons.wb_sunny_outlined},
      {'ar': 'العصر', 'en': 'Asr', 'icon': Icons.wb_sunny_rounded},
      {'ar': 'المغرب', 'en': 'Maghrib', 'icon': Icons.brightness_6},
      {'ar': 'العشاء', 'en': 'Isha', 'icon': Icons.nights_stay},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: Center(
        child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            if (state is PrayerTimesLoaded) {
              List<dynamic> adhanDataMonth = getAdhanDataForCurrentMonth(
                  state.yearAdhanModel.data,
                  int.parse(PrayerTimesCubit.get(context).selectedMonth));
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView.separated(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MonthSelector(
                              monthNo:
                                  MonthSelector.months[index]['no'] as String,
                              monthAr:
                                  MonthSelector.months[index]['ar'] as String,
                              selectedMonth:
                                  PrayerTimesCubit.get(context).selectedMonth,
                              pageController1: pageController,
                              pageController2: pageController2,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 15,
                              ),
                          itemCount: MonthSelector.months.length),
                    ),
                    const SizedBox(height: 20),
                    DateSlider(
                      pageController: pageController,
                      pageController2: pageController2,
                      adhanDataMonth: adhanDataMonth,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: PrayersTimesList(
                        pageController: pageController,
                        prayers: prayers,
                        adhanDataMonth: adhanDataMonth,
                        pageController2: pageController2,
                      ),
                    )
                  ],
                ),
              );
            } else if (state is PrayerTimesError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
