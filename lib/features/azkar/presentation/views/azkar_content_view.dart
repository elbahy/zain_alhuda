import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';
import 'package:zain_alhuda/features/azkar/data/models/azkar_model.dart';

class AzkarContentView extends StatelessWidget {
  const AzkarContentView({super.key, required this.data});

  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.thirdColor],
            ),
            image: DecorationImage(image: AssetImage(Assets.assetsImagesAppBarBg), fit: BoxFit.cover),
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Center(
                  child: AzkarContentItem(
                repeat: data.content[index].repeat,
                zakr: data.content[index].zekr,
              )),
          itemCount: data.content.length),
    );
  }
}

class AzkarContentItem extends StatelessWidget {
  const AzkarContentItem({
    super.key,
    required this.zakr,
    required this.repeat,
  });
  final String zakr;
  final int repeat;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .85,
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1, color: AppColors.primaryColor),
            // boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2, offset: Offset(3, 3))],
          ),
          child: Text(zakr, style: AppStyles.elmisri700Size18, textAlign: TextAlign.center),
        ),
        Positioned(
          bottom: -20,
          right: 30,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * .70,
            decoration: const BoxDecoration(
              color: AppColors.thirdColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('التكرار', style: AppStyles.elmisri400Size30.copyWith(fontSize: 20), textAlign: TextAlign.center),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 21,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.thirdColor,
                    child: Text('$repeat', style: AppStyles.elmisri400Size30.copyWith(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 10),
                Text('|', style: AppStyles.elmisri400Size30.copyWith(fontSize: 20)),
                const SizedBox(width: 10),
                Text('مشاركة', style: AppStyles.elmisri400Size30.copyWith(fontSize: 20)),
                const Icon(Icons.share, color: Colors.white, size: 30),
              ],
            ),
          ),
        )
      ],
    );
  }
}
