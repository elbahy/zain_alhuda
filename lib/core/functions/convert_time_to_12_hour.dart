String convertTimeTo12HourWithPeriod(String time24) {
  time24 = time24.substring(0, 5);
  List<String> parts = time24.split(':');
  int hour = int.parse(parts[0]);
  String minute = parts[1];
  String perid = hour >= 12 ? 'م' : 'ص';
  hour = hour % 12;
  if (hour >= 12) {
    hour = hour - 12;
  } else if (hour == 0) {
    hour = 12;
  }
  String time12 = '${hour.toString().padLeft(2, '0')}:$minute  $perid';
  return time12;
}

String convertTimeTo12Hour(String time24) {
  time24 = time24.substring(0, 5);
  List<String> parts = time24.split(':');
  int hour = int.parse(parts[0]);
  String minute = parts[1];

  hour = hour % 12;
  if (hour >= 12) {
    hour = hour - 12;
  } else if (hour == 0) {
    hour = 12;
  }
  String time12 = '${hour.toString().padLeft(2, '0')}:$minute ';
  return time12;
}
