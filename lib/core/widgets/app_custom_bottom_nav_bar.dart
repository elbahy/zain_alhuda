import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_view.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/views/surah_view.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<PersistentTabConfig> tabs = [
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => HomeCubit()..getLocation(),
          child: const HomeView(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          title: "الرئيسية",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
          activeColorSecondary: AppColors.primaryColor,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => QuranCubit()..getQuran(),
          child: const SurahView(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.book),
          title: "القرآن الكريم",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
          activeColorSecondary: AppColors.primaryColor,
        ),
      ),
      PersistentTabConfig(
        screen: const AzkarView(),
        item: ItemConfig(
          icon: const Icon(Icons.handshake),
          title: "الأذكار",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
          activeColorSecondary: AppColors.primaryColor,
        ),
      ),
      PersistentTabConfig(
        screen: const PrayerTimesView(),
        item: ItemConfig(
          icon: SvgPicture.asset(
            Assets.assetsImagesQuranIcon,
            height: 30,
            colorFilter: const ColorFilter.linearToSrgbGamma(),
          ),
          title: "مواعيد الصلاة",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
          activeColorSecondary: AppColors.primaryColor,
        ),
      ),
    ];
    return PersistentTabView(
      tabs: tabs,
      navBarBuilder: (navBarConfig) => Style8BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
