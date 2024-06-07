import 'package:zain_alhuda/features/prayer_times/data/models/today_adhan_model.dart';

abstract class PrayerTimesState {}

class PrayerTimesInitial extends PrayerTimesState {}

class GetLocationLoading extends PrayerTimesState {}

class GetLocationSuccess extends PrayerTimesState {
  final double latitude;
  final double longitude;
  GetLocationSuccess({required this.latitude, required this.longitude});
}

class GetLocationFailure extends PrayerTimesState {
  final String errorMsg;
  GetLocationFailure({required this.errorMsg});
}

class GetAdhanTodayLoading extends PrayerTimesState {}

class GetAdhanTodaySuccess extends PrayerTimesState {
  final TodayAdhanModel todayAdhanToday;

  GetAdhanTodaySuccess({required this.todayAdhanToday});
}

class GetAdhanTodayFailure extends PrayerTimesState {
  final String errorMsg;

  GetAdhanTodayFailure({required this.errorMsg});
}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final TodayAdhanModel todayAdhanModel;

  PrayerTimesLoaded({required this.todayAdhanModel});
}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  PrayerTimesError({required this.message});
}
