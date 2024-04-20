import 'package:flutter/material.dart';
import 'package:zain_alhuda/core/utils/app_colors.dart';
import 'dart:async';
import 'package:zain_alhuda/core/utils/app_styles.dart';

class PrayerCountdown extends StatefulWidget {
  final String prayerTime;
  final VoidCallback onCountdownFinished;

  const PrayerCountdown({Key? key, required this.prayerTime, required this.onCountdownFinished}) : super(key: key);

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
    // إنشاء التاريخ والوقت لصلاة الفجر
    var prayerDateTime = DateTime(now.year, now.month, now.day, hours, minutes);

    if (hours > 1 && hours < 7) {
      if (now.hour > hours) {
        prayerDateTime = DateTime(now.year, now.month, now.day + 1, hours, minutes);
      }
    }
    setState(() {
      _timeLeft = prayerDateTime.difference(now);
      if (_timeLeft <= Duration.zero) {
        // انتهاء العد، استدعاء الـ Callback
        widget.onCountdownFinished();
      }
      if (now.hour == 00 && now.minute == 00 && now.second == 00) {
        widget.onCountdownFinished();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(' ${_timeLeft.inHours}:${(_timeLeft.inMinutes % 60).toString().padLeft(2, '0')}:${(_timeLeft.inSeconds % 60).toString().padLeft(2, '0')}', style: AppStyles.elmisri500Size16.copyWith(color: AppColors.secondColor));
  }
}
