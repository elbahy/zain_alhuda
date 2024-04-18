import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'dart:async';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class PrayerCountdown extends StatefulWidget {
  final String prayerTime;

  const PrayerCountdown({Key? key, required this.prayerTime}) : super(key: key);

  @override
  _PrayerCountdownState createState() => _PrayerCountdownState();
}

class _PrayerCountdownState extends State<PrayerCountdown> {
  late Timer _timer;
  late Duration _timeLeft;

  @override
  void initState() {
    super.initState();
    _updateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimeLeft();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimeLeft() {
    final prayerTimeParts = widget.prayerTime.split(':');
    final hours = int.parse(prayerTimeParts[0]);
    final minutes = int.parse(prayerTimeParts[1]);
    final now = DateTime.now();
    final prayerDateTime = DateTime(now.year, now.month, now.day, hours, minutes);
    setState(() {
      _timeLeft = prayerDateTime.difference(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(' ${_timeLeft.inHours}:${(_timeLeft.inMinutes % 60).toString().padLeft(2, '0')}:${(_timeLeft.inSeconds % 60).toString().padLeft(2, '0')}', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor));
  }
}
