import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/databases/local_json/json_load.dart';
import 'package:zain_alhuda/core/databases/local_json/json_strings.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/features/quran/data/models/quran_model.dart';
import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  Future<void> getSurahList() async {
    emit(GetSurahListLoading());
    try {
      JsonLoad().loadJson(path: JsonStrings.surahListPath).then((value) {
        SurahListModel surahListModel = SurahListModel.fromJson(value);
        emit(GetSurahListSuccess(surahList: surahListModel));
      });
    } on Exception catch (e) {
      emit(GetSurahListFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getQuran() async {
    emit(GetQuranLoading());
    try {
      JsonLoad().loadJson(path: JsonStrings.quranFullPath).then((value) {
        QuranModel quranModel = QuranModel.fromJson(value);
        emit(GetQuranSuccess(quranModel: quranModel));
      });
    } on Exception catch (e) {
      emit(GetQuranFailure(errorMessage: e.toString()));
    }
  }
}

class QuranAppBarCubit extends Cubit<QuranAppBarState> {
  QuranAppBarCubit() : super(QuranAppBarInitial());
  int page = getIt<CacheHelper>().getData(key: 'bookmarkPage') ?? 605;

  void bookmarkPage(int pageNum) {
    emit(QuranAppBarBookmarkLoading());
    getIt<CacheHelper>().saveData(key: 'bookmarkPage', value: pageNum);
    emit(QuranAppBarBookmarkSuccess());
  }
}
