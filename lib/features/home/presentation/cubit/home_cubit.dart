import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void lastQuranRead() {
    var surahNum = getIt<CacheHelper>().getData(key: 'lastSurahNum');
    var quranPage = getIt<CacheHelper>().getData(key: 'lastQuranPage');
    if (surahNum != null && quranPage != null) {
      emit(GetLastQuranReadSuccess(
        surahNum: surahNum,
        quranPage: quranPage,
      ));
    } else {
      emit(GetLastQuranReadFailure());
    }
  }
}
