import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/core/widgets/app_custom_bottom_nav_bar.dart';
import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';
import 'package:zain_alhuda/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_content_view.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_result_view.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_view.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/views/surah_view.dart';
import 'package:zain_alhuda/features/quran/presentation/views/quran_view.dart';
import 'package:zain_alhuda/features/splash/presentation/views/splash_view.dart';
import 'package:zain_alhuda/features/reciters/presentation/views/reciters_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/bottomNavBar',
      builder: (context, state) => const AppBottomNavBar(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => PrayerTimesCubit()..getAdhanToday(),
          )
        ],
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: '/surahList',
      builder: (context, state) => BlocProvider(
        create: (context) => QuranCubit()..getSurahList(),
        child: const SurahView(),
      ),
    ),
    GoRoute(
      path: '/reciters',
      builder: (context, state) => const RecitersView(),
    ),
    GoRoute(
      path: '/prayerTimes',
      builder: (context, state) => BlocProvider(
        create: (context) => PrayerTimesCubit()..getAdhanYear(DateTime.now().year.toString()),
        child: const PrayerTimesView(),
      ),
    ),
    GoRoute(
      path: '/azkar',
      builder: (context, state) => BlocProvider(
        create: (context) => AzkarCubit()..getAzkar(),
        child: const AzkarView(),
      ),
    ),
    GoRoute(
      path: '/azkarContent',
      builder: (context, state) => AzkarContentView(data: state.extra as Datum),
    ),
    GoRoute(
      path: '/azkarResult',
      builder: (context, state) => AzkarResult(count: state.extra as int),
    ),
    GoRoute(
      path: '/quran',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => QuranCubit()..getQuran(),
          ),
          BlocProvider(
            create: (context) => QuranAppBarCubit(),
          ),
        ],
        child: QuranView(page: state.extra as int),
      ),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBardingView(),
    ),
  ]);
}
