import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/azkar/presentation/cubit/azkar_cubit.dart';
import 'package:zain_alhuda/features/azkar/presentation/views/azkar_view.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/views/prayer_times_view.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/views/surah_view.dart';
import 'package:zain_alhuda/features/supplications/presentation/views/supplications_view.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller = PersistentTabController(initialIndex: 2);
    List<PersistentTabConfig> tabs = [
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => QuranCubit()..getSurahList(),
          child: const SurahView(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.book),
          title: "القرآن الكريم",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => AzkarCubit()..getAzkar(),
          child: const AzkarView(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.handshake),
          title: "الأذكار",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => HomeCubit()..getLocation(),
          child: const HomeView(),
        ),
        item: ItemConfig(
          icon: const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.home),
          ),
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
        ),
      ),
      PersistentTabConfig(
        screen: const PrayerTimesView(),
        item: ItemConfig(
          icon: SvgPicture.asset(
            Assets.assetsImagesQuranIcon,
            height: 40,
            width: 40,
            colorFilter: const ColorFilter.mode(
              AppColors.secondColor,
              BlendMode.srcIn,
            ),
          ),
          title: "مواعيد الصلاة",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
        ),
      ),
      PersistentTabConfig(
        screen: const SupplicationsView(),
        item: ItemConfig(
          icon: const Icon(Icons.handshake),
          title: "الأدعية",
          textStyle: AppStyles.elmisri500Size16,
          activeForegroundColor: AppColors.secondColor,
        ),
      ),
    ];
    return PersistentTabView(
      controller: controller,
      tabs: tabs,
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarDecoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: AppColors.primaryColor,
        ),
        navBarConfig: navBarConfig,
      ),
    );
  }
}
