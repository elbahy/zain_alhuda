import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/calendar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/drawer_widget.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_app_bar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_shortcut_item.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/menu_grid.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/shortcuts_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeAppBar.scafoldKey,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: HomeAppBar()),
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: Calendar()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(child: ShortcutsSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(child: MenuGrid()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShortcutItem(
                      onTap: () {},
                      bgImage: Assets.assetsImagesNight,
                      text: const Text('اذكار الصباح'),
                      title: ''),
                  const SizedBox(height: 20),
                  ShortcutItem(
                      onTap: () {},
                      bgImage: Assets.assetsImagesNight,
                      text: const Text('اذكار المساء'),
                      title: ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
