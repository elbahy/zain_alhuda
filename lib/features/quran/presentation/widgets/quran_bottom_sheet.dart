import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/quran/presentation/widgets/go_to_page_widget.dart';

class QuranBottomSheet extends StatelessWidget {
  const QuranBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController goToPageController = TextEditingController();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .15,
      width: double.infinity,
      child: Column(
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
              label: Text(' السور', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.primaryColor, fontSize: 18))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
}
