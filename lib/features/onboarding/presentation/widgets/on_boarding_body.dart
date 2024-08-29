import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/onboarding/data/models/onboarding_content_model.dart';

class OnboradingBody extends StatelessWidget {
  const OnboradingBody({
    super.key,
    required this.index,
    required this.onboardingContentList,
  });
  final int index;
  final List<OnboardingContentModel> onboardingContentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1.25,
          child: Image.asset(onboardingContentList[index].imagePath),
        ),
        Text(
          onboardingContentList[index].title,
          style: AppStyles.elmisri400Size30.copyWith(
              color: AppColors.primaryColor, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            onboardingContentList[index].description,
            style: AppStyles.elmisri500Size16
                .copyWith(color: AppColors.thirdColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
