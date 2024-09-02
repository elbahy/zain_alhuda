import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class DateSlider extends StatelessWidget {
  const DateSlider({
    super.key,
    required this.pageController,
    required this.pageController2,
    required this.adhanDataMonth,
  });

  final PageController pageController;
  final PageController pageController2;
  final List adhanDataMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn);
            pageController2.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            height: 50,
            child: PageView.builder(
              controller: pageController2,
              itemCount: adhanDataMonth.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    '${adhanDataMonth[index].date.hijri.weekday.ar} ${adhanDataMonth[index].date.gregorian.date} ',
                    style: AppStyles.elmisri700Size18,
                  ),
                );
              },
              onPageChanged: (value) => pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn),
            )),
        IconButton(
          onPressed: () {
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn);
            pageController2.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn);
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
