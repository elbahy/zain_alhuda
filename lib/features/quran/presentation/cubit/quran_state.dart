import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';

abstract class QuranState {}

final class QuranInitial extends QuranState {}

final class GetQuranLoading extends QuranState {}

final class GetQuranSuccess extends QuranState {
  final QuranModel quranModel;
  GetQuranSuccess({required this.quranModel});
}

final class GetQuranFailure extends QuranState {
  final String errorMessage;
  GetQuranFailure({required this.errorMessage});
}

class GetSurahListLoading extends QuranState {}

class GetSurahListSuccess extends QuranState {
  final SurahListModel surahList;
  GetSurahListSuccess({required this.surahList});
}

class GetSurahListFailure extends QuranState {
  final String errorMessage;
  GetSurahListFailure({required this.errorMessage});
}

abstract class QuranAppBarState {}

final class QuranAppBarInitial extends QuranAppBarState {}

final class QuranAppBarBookmarkLoading extends QuranAppBarState {}

final class QuranAppBarBookmarkSuccess extends QuranAppBarState {}

abstract class QuranSt {}

class QuranIntSt extends QuranSt {}

class GetQuranLocadingSt extends QuranIntSt {}

class GetQuranSuccessSt extends QuranIntSt {
  final String pageData;
  GetQuranSuccessSt({required this.pageData});
}

class GetQuranFailureSt extends QuranIntSt {
  final String errorMessage;
  GetQuranFailureSt({required this.errorMessage});
}
