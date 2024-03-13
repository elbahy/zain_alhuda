import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zain_alhuda/core/widgets/custom_app_bar.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/quran_tab_view.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/search_widget.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});

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
                      child: const QuranTabView())),
            ],
          ),
        ));
  }
}
