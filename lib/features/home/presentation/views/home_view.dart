import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/calendar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_app_bar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/last_quran_read.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/menu_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeAppBar.scafoldKey,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(70), child: HomeAppBar()),
      endDrawer: const Drawer(
        child: Column(children: [Text('test')]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: Calendar()),
            SliverToBoxAdapter(
              child: getIt<CacheHelper>().getData(key: 'lastSurahNum') != null ? const LastQuranRead() : const SizedBox(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(child: MenuGrid())
          ],
        ),
      ),
    );
  }
}
