import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                Assets.assetsImagesMenu,
                color: AppColors.primaryColor,
              ),
              onPressed: () {}),
        ],
        leading: Image.asset(Assets.assetsImagesApplogo),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.thirdColor],
                      end: FractionalOffset(2.0, 0.0),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 20),
                        const Text("الاربعاء",
                            style: AppStyles.elmisri400Size30),
                        Image.asset(Assets.assetsImagesIslamicCalender,
                            opacity: const AlwaysStoppedAnimation(0.5),
                            width: 100)
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" 27 شعبان 1445",
                            style: AppStyles.elmisri400Size30)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItem(
                          icon: Assets.assetsImagesQuranIcon, text: "القرآن"),
                      MenuItem(
                          icon: Assets.assetsImagesEzkarIcon, text: "الأذكار"),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItem(
                          icon: Assets.assetsImagesMosqueicon,
                          text: "مواعيد الصلاة"),
                      MenuItem(
                          icon: Assets.assetsImagesDoaaIcon, text: "الأدعية"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 150,
      width: 200,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.secondColor),
            child: SvgPicture.asset(icon,
                color: AppColors.primaryColor, width: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppStyles.elmisri400Size18),
              const Icon(Icons.arrow_forward, color: AppColors.primaryColor)
            ],
          )
        ],
      ),
    );
  }
}
