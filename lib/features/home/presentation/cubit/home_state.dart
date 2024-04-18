import 'package:zain_alhuda/features/home/data/models/adhan_model.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class GetLastQuranReadSuccess extends HomeState {
  final int surahNum;
  final int quranPage;

  GetLastQuranReadSuccess({required this.quranPage, required this.surahNum});
}

class GetLastQuranReadFailure extends HomeState {}

class GetLocationLoading extends HomeState {}

class GetLocationSuccess extends HomeState {
  final double latitude;
  final double longitude;
  GetLocationSuccess({required this.latitude, required this.longitude});
}

class GetLocationFailure extends HomeState {
  final String errorMsg;
  GetLocationFailure({required this.errorMsg});
}

class GetAdhanTodayLoading extends HomeState {}

class GetAdhanTodaySuccess extends HomeState {
  final AdhanModel adhanToday;

  GetAdhanTodaySuccess({required this.adhanToday});
}

class GetAdhanTodayFailure extends HomeState {
  final String errorMsg;

  GetAdhanTodayFailure({required this.errorMsg});
}

class GetNextPrayerLoading extends HomeState {}

class GetNextPrayerSuccess extends HomeState {
  final String nextPraying;

  GetNextPrayerSuccess({required this.nextPraying});
}
