import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/local_json/json_load.dart';
import 'package:zain_alhuda/core/databases/local_json/json_strings.dart';
import 'package:zain_alhuda/features/quran/data/models/surah_model.dart';
import 'package:zain_alhuda/features/quran/presentation/cubit/quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  late SurahModel surahModel;

  Future<void> getSurah() async {
    emit(GetSurahLoading());
    try {
      JsonLoad().loadJson(path: JsonStrings.surahListPath).then((value) {
        surahModel = SurahModel.fromJson(value);
        emit(GetSurahSuccess(surahModel: surahModel));
      });
    } on Exception catch (e) {
      print(e.toString());
      emit(GetSurahFailure(errorMessage: e.toString()));
    }
  }
}
