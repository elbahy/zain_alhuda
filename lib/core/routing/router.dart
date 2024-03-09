import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_view.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:zain_alhuda/features/quran/presentation/views/quran_view.dart';
import 'package:zain_alhuda/features/supplications/presentation/views/supplications_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/quran',
      builder: (context, state) => const QuranView(),
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
  ]);
}
