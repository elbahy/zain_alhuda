import 'package:flutter/material.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/calandar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:zain_alhuda/features/home/presentation/widgets/menu_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: CustomAppBar.scafoldKey,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: CustomAppBar()),
      endDrawer: const Drawer(
        child: Column(
          children: [Text('test')],
        ),
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
