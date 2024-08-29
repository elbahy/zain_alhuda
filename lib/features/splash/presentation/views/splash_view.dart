import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
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
      bool isVisted = getIt<CacheHelper>().getData(key: 'isOnBoardingVisted') ?? false;
      isVisted ? CustomeNavigate.replace(context, '/home') : CustomeNavigate.replace(context, '/onBoarding');
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
