import 'package:zain_alhuda/core/utils/app_assets.dart';

class OnboardingContentModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingContentModel(
      {required this.title,
      required this.description,
      required this.imagePath});
}

List<OnboardingContentModel> onboardingContentList = [
  OnboardingContentModel(
    title: "القرآن الكريم بأصوات متعددة",
    description:
        "يمكنك الآن الاستماع إلى القرآن الكريم بصوت عدة مقرئين بجودة عالية وبكل سهولة من خلال التطبيق",
    imagePath: Assets.assetsImagesOnboardingQuran,
  ),
  OnboardingContentModel(
    title: 'الأدعية والأذكار',
    description:
        'مجموعة شاملة من الأدعية والأذكار التي تشمل أوقات الصباح والمساء والأوقات الخاصة بالعبادات اليومية',
    imagePath: Assets.assetsImagesOnboardingDoaa,
  ),
  OnboardingContentModel(
    title: "مواقيت الصلاة",
    description:
        'متابعة مواقيت الصلاة بدقة في أي مكان تتواجد فيه، مع إشعارات مخصصة لكل وقت صلاة',
    imagePath: Assets.assetsImagesOnboardingPrayTimes,
  ),
];
