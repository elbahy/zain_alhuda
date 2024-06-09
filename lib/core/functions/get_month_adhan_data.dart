import 'package:zain_alhuda/features/prayer_times/data/models/year_adhan_model.dart';

List<dynamic> getAdhanDataForCurrentMonth(Data adhanData, int selectedMonth) {
  switch (selectedMonth) {
    case 1:
      return adhanData.the1;

    case 2:
      return adhanData.the2;
    case 3:
      return adhanData.the3;
    case 4:
      return adhanData.the4;
    case 5:
      return adhanData.the5;
    case 6:
      return adhanData.the6;
    case 7:
      return adhanData.the7;
    case 8:
      return adhanData.the8;
    case 9:
      return adhanData.the9;
    case 10:
      return adhanData.the10;
    case 11:
      return adhanData.the11;
    case 12:
      return adhanData.the12;
    default:
      return [];
  }
}
