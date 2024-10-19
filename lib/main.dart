import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/routing/router.dart';
import 'package:zain_alhuda/core/services/local_notifications_service.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(const ZainAlhuda());
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await getIt<LocalNotificationsService>().flutterLocalNotificationsInilizer();
  await getIt<LocalNotificationsService>().showRepeatingNotification(
    id: 0,
    title: 'هل صليت اليوم على النبي',
    body:
        'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا (56)',
    repeateInterval: RepeatInterval.daily,
  );
}

class ZainAlhuda extends StatelessWidget {
  const ZainAlhuda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      locale: const Locale('ar'),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColors.secondColor,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            titleTextStyle: AppStyles.elmisri400Size30.copyWith(fontSize: 25),
            centerTitle: true,
            foregroundColor: AppColors.secondColor,
          )),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
