String getArabicWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return 'الاثنين';
    case 2:
      return 'الثلاثاء';
    case 3:
      return 'الأربعاء';
    case 4:
      return 'الخميس';
    case 5:
      return 'الجمعة';
    case 6:
      return 'السبت';
    case 7:
      return 'الأحد';
    default:
      return 'غير معروف';
  }
}

void main() {
  var today = DateTime.now().weekday;
  print(getArabicWeekday(today)); // سيطبع اسم اليوم بالعربية
}
