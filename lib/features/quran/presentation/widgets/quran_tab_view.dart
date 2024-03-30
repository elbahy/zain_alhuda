import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/juz_list_view.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/surah_list_view.dart';

class SurahTabView extends StatefulWidget {
  const SurahTabView({super.key});

  @override
  State<SurahTabView> createState() => _SurahTabViewState();
}

class _SurahTabViewState extends State<SurahTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            dividerHeight: 0,
            indicatorColor: AppColors.thirdColor,
            unselectedLabelStyle: AppStyles.elmisri700Size18
                .copyWith(fontWeight: FontWeight.w500),
            labelStyle: AppStyles.elmisri700Size18
                .copyWith(color: AppColors.thirdColor),
            tabs: const [
              Tab(child: Text('السور')),
              Tab(child: Text('الأجزاء')),
            ]),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            SurahListView(),
            JuzListView(),
          ]),
        )
      ],
    );
  }
}
