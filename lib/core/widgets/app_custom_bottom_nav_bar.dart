import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_cubit.dart';
import 'package:zain_alhuda/features/home/presentation/views/home_view.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:zain_alhuda/features/quran/presentation/views/surah_view.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

int curentIndex = 0;
List<Widget> pages = [
  BlocProvider(create: (_) => HomeCubit()..getLocation(), child: const HomeView()),
  BlocProvider(
    create: (context) => QuranCubit()..getQuran(),
    child: const SurahView(),
  ),
  const HomeView(),
  const HomeView(),
];

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.calendar_month,
          Icons.bookmark,
          Icons.calendar_month,
          Icons.bookmark,
        ],
        activeIndex: curentIndex,
        onTap: (x) {
          (index) => setState(() => curentIndex = x);
        },
        backgroundColor: Colors.white,
        inactiveColor: Colors.grey,
        activeColor: Colors.blue,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 12,
        rightCornerRadius: 12,
      ),
    );
  }
}
