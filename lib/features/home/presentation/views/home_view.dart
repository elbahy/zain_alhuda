import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "الاربعاء",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.secondColor,
                    fontFamily: 'ElMessiri',
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
