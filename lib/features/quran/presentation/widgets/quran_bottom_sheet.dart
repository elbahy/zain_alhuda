import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class QuranBottomSheet extends StatelessWidget {
  const QuranBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController goToPageController = TextEditingController();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.07,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                  onPressed: () {
                    CustomeNavigate.replace(
                      context,
                      '/surahList',
                    );
                  },
                  icon: const Icon(
                    Icons.format_list_bulleted,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(' السور', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.primaryColor, fontSize: 14))),
              getIt<CacheHelper>().getData(key: 'bookmarkPage') != null
                  ? TextButton.icon(
                      onPressed: () {
                        CustomeNavigate.replace(context, '/quran', extra: getIt<CacheHelper>().getData(key: 'bookmarkPage'));
                      },
                      icon: const Icon(Icons.bookmark, color: AppColors.primaryColor),
                      label: Text('انتقال الى العلامة', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.primaryColor, fontSize: 14)))
                  : const SizedBox(),
              TextButton.icon(
                  onPressed: () {
                    goToPage(context, goToPageController);
                  },
                  icon: const Icon(Icons.article_outlined, color: AppColors.primaryColor),
                  label: Text('انتقال الى صفحة', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.primaryColor, fontSize: 14)))
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> goToPage(BuildContext context, TextEditingController goToPageController) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: TextField(
              controller: goToPageController,
            ),
            actions: [
              TextButton.icon(
                  onPressed: () {
                    CustomeNavigate.replace(context, '/quran', extra: int.tryParse(goToPageController.text) ?? getIt<CacheHelper>().getData(key: 'lastQuranPage'));
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('انتقال'))
            ],
          );
        });
  }
}
