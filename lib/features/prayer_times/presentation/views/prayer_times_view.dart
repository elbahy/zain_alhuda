import 'package:flutter/material.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body: const Center(
        child: Text('Prayer Times View'),
      ),
    );
  }
}
