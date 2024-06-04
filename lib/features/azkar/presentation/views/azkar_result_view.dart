import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              AzkarResultItem(
                  count: Text(
                    ' + $count',
                    style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor, fontSize: 30),
                  ),
                  result: 'الأذكار المضافة'),
              const SizedBox(
                height: 20,
              ),
              AzkarResultItem(
                  count: Countup(
                    duration: const Duration(seconds: 1),
                    begin: oldTotal.toDouble(),
                    end: getIt<CacheHelper>().getData(key: 'azkarFinished').toDouble(),
                    style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor, fontSize: 30),
                  ),
                  result: 'إجمالي الأذكار'),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(); // عرض مؤشر تحميل أثناء الانتظار
                    } else {
                      return Column(
                        children: [
                          Text(
                            'اللهم تقبل',
                            style: AppStyles.elmisri700Size18.copyWith(fontSize: 35, color: AppColors.thirdColor),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                CustomeNavigate.replace(context, '/azkar');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.thirdColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              child: Text('العودة ', style: AppStyles.elmisri700Size18.copyWith(color: AppColors.secondColor))),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AzkarResultItem extends StatelessWidget {
  const AzkarResultItem({
    super.key,
    required this.count,
    required this.result,
  });

  final Widget count;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: 50,
      decoration: const BoxDecoration(color: AppColors.thirdColor, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * .40,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                result,
                style: AppStyles.elmisri500Size16.copyWith(
                  color: AppColors.secondColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .30,
            child: Center(child: count),
          ),
        ],
      ),
    );
  }
}
