import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/local_notifications_service.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      bool isVisted =
          getIt<CacheHelper>().getData(key: 'isOnBoardingVisted') ?? false;
      if (isVisted) {
        CustomeNavigate.replace(context, '/home');
      } else {
        CustomeNavigate.replace(context, '/onBoarding');
        getIt<LocalNotificationsService>().showRepeatingNotification(
          id: 0,
          title: 'هل صليت على النبي اليوم',
          body:
              'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا (56)',
          repeateInterval: RepeatInterval.daily,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        Assets.assetsImagesApplogo,
        width: 250,
      )),
    );
  }
}
