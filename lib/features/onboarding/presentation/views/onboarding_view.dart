import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/functions/custome_navigate.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/onboarding/data/models/onboarding_content_model.dart';
import 'package:zain_alhuda/features/onboarding/presentation/widgets/animated_dot_widget.dart';
import 'package:zain_alhuda/features/onboarding/presentation/widgets/on_boarding_body.dart';

class OnBardingView extends StatefulWidget {
  const OnBardingView({super.key});

  @override
  State<OnBardingView> createState() => _OnBardingViewState();
}

int _selectedIndex = 0;

class _OnBardingViewState extends State<OnBardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: PageView.builder(
                onPageChanged: (value) => setState(() {
                  _selectedIndex = value;
                }),
                itemBuilder: (context, index) {
                  return OnboradingBody(
                    onboardingContentList: onboardingContentList,
                    index: index,
                  );
                },
                itemCount: onboardingContentList.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingContentList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AnimatedDot(
                    isActive: index == _selectedIndex,
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  CustomeNavigate.replace(context: context, screen: '/home');
                  getIt<CacheHelper>()
                      .saveData(key: 'isOnBoardingVisted', value: true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  'إبدا إلان',
                  style:
                      AppStyles.elmisri500Size16.copyWith(color: Colors.white),
                )),
          ],
        ),
      )),
    );
  }
}
