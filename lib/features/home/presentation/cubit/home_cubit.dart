import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zain_alhuda/core/api/api_consumer.dart';
import 'package:zain_alhuda/core/services/service_locator.dart';
import 'package:zain_alhuda/features/home/data/models/adhan_model.dart';
import 'package:zain_alhuda/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  // void lastQuranRead() async {
  //   var surahNum = getIt<CacheHelper>().getData(key: 'lastSurahNum');
  //   var quranPage = getIt<CacheHelper>().getData(key: 'lastQuranPage');
  //   if (surahNum != null && quranPage != null) {
  //     emit(GetLastQuranReadSuccess(
  //       surahNum: surahNum,
  //       quranPage: quranPage,
  //     ));
  //   } else {
  //     emit(GetLastQuranReadFailure());
  //   }
  // }

  void getLocation() async {
    emit(GetLocationLoading());
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(GetLocationFailure(errorMsg: 'Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(GetLocationFailure(errorMsg: 'Location permissions are denied.'));
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      emit(GetLocationFailure(errorMsg: 'Location permissions are permanently denied, we cannot request permissions.'));
    }
    await Geolocator.getCurrentPosition().then((value) {
      emit(GetLocationSuccess(latitude: value.altitude, longitude: value.latitude));
      getAdhanToday(value.latitude, value.longitude);
    });
  }

  Future<void> getAdhanToday(double latitude, double longitude) async {
    AdhanModel adhanModel;
    emit(GetAdhanTodayLoading());
    try {
      await ApiConsumer().get(path: 'timings/today?latitude=$latitude&longitude=$longitude&method=5').then((value) {
        print(value);
        adhanModel = AdhanModel.fromJson(value);
        emit(GetAdhanTodaySuccess(adhanToday: adhanModel));
      });
    } catch (e) {
      emit(GetAdhanTodayFailure(errorMsg: e.toString()));
      print(e.toString());
    }
  }
}
