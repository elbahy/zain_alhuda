import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';

class QuranState {}

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

class QuranAppBarState {}

final class QuranAppBarInitial extends QuranAppBarState {}

final class QuranAppBarBookmarkLoading extends QuranAppBarState {}

final class QuranAppBarBookmarkSuccess extends QuranAppBarState {}
