import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';

sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class GetSurahListLoading extends QuranState {}

final class GetSurahListSuccess extends QuranState {
  final SurahListModel surahModel;
  GetSurahListSuccess({required this.surahModel});
}

final class GetSurahListFailure extends QuranState {
  final String errorMessage;
  GetSurahListFailure({required this.errorMessage});
}

final class GetQuranLoading extends QuranState {}

final class GetQuranSuccess extends QuranState {
  final QuranModel quranModel;
  GetQuranSuccess({required this.quranModel});
}

final class GetQuranFailure extends QuranState {
  final String errorMessage;
  GetQuranFailure({required this.errorMessage});
}
