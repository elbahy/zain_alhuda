import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/widgets/custom_app_bar.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/last_quran_read_widget.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/quran_tab_view.dart';
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
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                getIt<CacheHelper>().getData(key: 'bookmarkPage') != null
                    ? IconButton(
                        onPressed: () {
                          CustomeNavigate.navigate(context, '/quran', extra: getIt<CacheHelper>().getData(key: 'bookmarkPage'));
                        },
                        icon: const Icon(Icons.bookmark_outlined, size: 30))
                    : const SizedBox(),
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: LastQuranReadWidget()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 270,
                  child: const SurahTabView(),
                ),
              ),
            ],
          ),
        ));
  }
}
