import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';

sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class GetSurahLoading extends QuranState {}

final class GetSurahSuccess extends QuranState {
  final SurahModel surahModel;
  GetSurahSuccess({required this.surahModel});
}

final class GetSurahFailure extends QuranState {
  final String errorMessage;
  GetSurahFailure({required this.errorMessage});
}
