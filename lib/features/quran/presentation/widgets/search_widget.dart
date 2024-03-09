import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/generated/l10n.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style:
              AppStyles.elmisri500Size16.copyWith(color: AppColors.thirdColor),
          decoration: InputDecoration(
            labelText: S.of(context).search,
            labelStyle: AppStyles.elmisri500Size16,
            contentPadding: const EdgeInsets.all(16),
            filled: true,
            suffixIcon: const Icon(Icons.search, color: AppColors.primaryColor),
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
