import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/widgets/app_bar_space.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواعيد الصلاة'),
        flexibleSpace: const AppBarSpace(),
      ),
      body: const Center(
        child: Text('Prayer Times View'),
      ),
    );
  }
}
