import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class ShortcutItem extends StatelessWidget {
  const ShortcutItem({
    super.key,
    required this.onTap,
    required this.bgImage,
    required this.text,
    required this.title,
  });

  final void Function()? onTap;
  final String bgImage;
  final Text text;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 75,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
            opacity: .3,
          ),
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, AppColors.thirdColor],
            end: FractionalOffset(.5, 1.0),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            title,
            style: AppStyles.elmisri700Size18
                .copyWith(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              text,
              const Icon(
                Icons.arrow_circle_left,
                color: AppColors.secondColor,
              ),
            ],
          ),

          // Text(
          //   ' الآية رقم ${convertNumberToArabic(getIt<CacheHelper>().getData(key: 'lastAyahNum') ?? 1)}',
          //   style: AppStyles.elmisri500Size16
          //       .copyWith(color: Colors.white, fontSize: 8),
          // ),
        ]),
      ),
    );
  }
}
