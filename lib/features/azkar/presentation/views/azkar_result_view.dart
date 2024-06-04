import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class AzkarResult extends StatelessWidget {
  const AzkarResult({super.key, required this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    int oldTotal = getIt<CacheHelper>().getData(key: 'azkarFinished') - count;
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسبة الأذكار'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('الاذكار المضافة'),
              const Icon(Icons.add),
              Text('$count'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مجموع الاذكار   : '),
              Countup(
                duration: const Duration(seconds: 1),
                begin: oldTotal.toDouble(),
                end: getIt<CacheHelper>().getData(key: 'azkarFinished').toDouble(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
