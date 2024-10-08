import 'package:flutter/material.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/calendar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/drawer_widget.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_app_bar.dart';
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
      body: const Padding(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Calendar()),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: ShortcutsSection()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: MenuGrid()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
