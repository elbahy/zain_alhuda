import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key, required this.quranPage});

  final int quranPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(initialPage: quranPage - 1),
          itemBuilder: (_, index) {
            getIt<CacheHelper>()
                .saveData(key: 'lastQuranPage', value: index + 1);
            return Image.asset('assets/images/page${index + 1}.png');
          },
          itemCount: 604,
        ),
      ),
    );
  }
}
