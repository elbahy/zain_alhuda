import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/calandar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/home_app_bar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/menu_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeAppBar.scafoldKey,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: HomeAppBar()),
      endDrawer: const Drawer(
        child: Column(children: [Text('test')]),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Calendar()),
            SliverToBoxAdapter(child: MenuGrid())
          ],
        ),
      ),
    );
  }
}
