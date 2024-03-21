import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_assets.dart';
import 'package:zain_alhuda/features/onboarding/data/models/onboarding_content_model.dart';

class OnbardingView extends StatefulWidget {
  const OnbardingView({super.key});

  @override
  State<OnbardingView> createState() => _OnbardingViewState();
}

int _selectedIndex = 0;

class _OnbardingViewState extends State<OnbardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) => setState(() {
                _selectedIndex = value;
              }),
              itemBuilder: (context, index) {
                return OnboradingBody(index: index);
              },
              itemCount: onboardingContentList.length,
            ),
          ),
          const SizedBox(height: 20),
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
        ],
      )),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    this.isActive = false,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 25 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

class OnboradingBody extends StatelessWidget {
  const OnboradingBody({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(onboardingContentList[index].imagePath),
        ),
        Text(
          onboardingContentList[index].title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            onboardingContentList[index].description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
