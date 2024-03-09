import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/core/widgets/custom_app_bar.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/search_widget.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: CustomAppBar(
              S.of(context).Quran,
              actions: const [Icon(Icons.bookmark_outlined, size: 30)],
            )),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SearchWidget()),
              SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: const CustomTabs())),
            ],
          ),
        ));
  }
}

class CustomTabs extends StatefulWidget {
  const CustomTabs({super.key});

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs>
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
            unselectedLabelStyle: AppStyles.elmisri700Size20
                .copyWith(fontWeight: FontWeight.w500),
            labelStyle: AppStyles.elmisri700Size20
                .copyWith(color: AppColors.thirdColor),
            tabs: const [
              Tab(child: Text('السور')),
              Tab(child: Text('الأجزاء')),
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            ListView(
              children: const [
                Text('data1'),
                Text('data2'),
                Text('data3'),
                Text('data4'),
                Text('data5'),
                Text('data6'),
              ],
            ),
            ListView(
              children: const [
                Text('data1'),
                Text('data2'),
                Text('data3'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data4'),
                Text('data7'),
              ],
            )
          ]),
        )
      ],
    );
  }
}
