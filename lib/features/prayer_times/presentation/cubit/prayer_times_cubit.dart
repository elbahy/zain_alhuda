import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zain_alhuda/core/api/api_consumer.dart';
import 'package:zain_alhuda/features/prayer_times/data/models/today_adhan_model.dart';
import 'package:zain_alhuda/features/prayer_times/data/models/year_adhan_model.dart';
import 'package:zain_alhuda/features/prayer_times/presentation/cubit/prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  String nextPraying = '';
  late double latitude;
  late double longitude;
  Future<void> getLocation() async {
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

      latitude = value.latitude;
      longitude = value.longitude;
    });
  }

  Future<void> getAdhanToday() async {
    TodayAdhanModel todayAdhanModel;
    await getLocation();
    emit(GetAdhanTodayLoading());
    try {
      await ApiConsumer().get(path: 'timings/today?latitude=$latitude&longitude=$longitude&method=5&adjustment=1').then((value) {
        todayAdhanModel = TodayAdhanModel.fromJson(value);
        emit(GetAdhanTodaySuccess(todayAdhanToday: todayAdhanModel));
        getNextPrayer(todayAdhanModel.data.timings);
      });
    } catch (e) {
      emit(GetAdhanTodayFailure(errorMsg: e.toString()));
    }
  }

  Future<void> getAdhanYear(String year) async {
    YearAdhanModel yearAdhanModel;
    await getLocation();
    emit(PrayerTimesLoading());
    try {
      await ApiConsumer().get(path: 'calandar/$year?latitude=$latitude&longitude=$longitude&method=5').then((value) {
        yearAdhanModel = YearAdhanModel.fromJson(value);
        emit(PrayerTimesLoaded(yearAdhanModel: yearAdhanModel));
      });
    } catch (e) {
      emit(PrayerTimesError(message: e.toString()));
    }
  }

  getNextPrayer(timings) {
    DateTime currentTime = DateTime.now();
    DateTime nextPrayerTime = DateTime(9999);

    final prayersToCompare = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

    timings.toJson().forEach(
      (prayer, time) {
        if (prayersToCompare.contains(prayer)) {
          final prayerTime = DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            int.parse(time.split(":")[0]),
            int.parse(time.split(":")[1]),
          );

          if (currentTime.isBefore(prayerTime) && prayerTime.isBefore(nextPrayerTime)) {
            nextPrayerTime = prayerTime;
            nextPraying = prayer;
          }

          if (nextPraying.isEmpty) {
            nextPraying = prayersToCompare.first;
          }
        }
      },
    );
  }
}
