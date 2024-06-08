import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    PageController pageController2 = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    pageController2.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    height: 50,
                    child: PageView.builder(
                      controller: pageController2,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Center(child: Text('${index + 1}'));
                      },
                    )),
                IconButton(
                  onPressed: () {
                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    pageController2.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  PageTest(test: '1'),
                  PageTest(test: '2'),
                  PageTest(test: '3'),
                  PageTest(test: '4'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageTest extends StatelessWidget {
  const PageTest({
    super.key,
    required this.test,
  });

  final String test;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(test));
  }
}
