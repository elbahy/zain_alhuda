import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_cubit.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_state.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/widgets/month_selector.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    PageController pageController2 = PageController();
    ScrollController scrollController = ScrollController(initialScrollOffset: 9, keepScrollOffset: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: Center(
        child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            return state is PrayerTimesLoaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ListView.separated(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return MonthSelector(
                                monthNo: MonthSelector.months[index]['no'] as String,
                                monthAr: MonthSelector.months[index]['ar'] as String,
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(
                                  width: 15,
                                ),
                            itemCount: MonthSelector.months.length),
                      ),
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
                  )
                : state is PrayerTimesError
                    ? Center(child: Text(state.message))
                    : const Center(child: CircularProgressIndicator());
          },
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
