import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_view.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/views/surah_view.dart';
import 'package:zain_alhuda/features/quran/presentation/views/quran_view.dart';
import 'package:zain_alhuda/features/splash/presentation/views/splash_view.dart';
import 'package:zain_alhuda/features/supplications/presentation/views/supplications_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/surahList',
      builder: (context, state) => BlocProvider(
        create: (context) => QuranCubit()..getQuran(),
        child: const SurahView(),
      ),
    ),
    GoRoute(
      path: '/supplications',
      builder: (context, state) => const SupplicationsView(),
    ),
    GoRoute(
      path: '/prayerTimes',
      builder: (context, state) => const PrayerTimesView(),
    ),
    GoRoute(
      path: '/azkar',
      builder: (context, state) => const AzkarView(),
    ),
    GoRoute(
      path: '/quran',
      builder: (context, state) => BlocProvider(
        create: (context) => QuranCubit()..getQuran(),
        child: QuranView(page: state.extra as int),
      ),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBardingView(),
    ),
  ]);
}
