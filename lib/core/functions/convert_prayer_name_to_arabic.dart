String convertPrayerNameToArabic(String prayerName) {
  switch (prayerName) {
    case 'Fajr':
      return 'الفجر';
    case 'Sunrise':
      return 'الشروق';
    case 'Dhuhr':
      return 'الظهر';
    case 'Asr':
      return 'العصر';
    case 'Sunset':
      return 'الغروب';
    case 'Maghrib':
      return 'المغرب';
    case 'Isha':
      return 'العشاء';
    case 'Imsak':
      return 'الإمساك';
    case 'Midnight':
      return 'منتصف الليل';
    case 'Firstthird':
      return 'الثلث الأول';
    case 'Lastthird':
      return 'الثلث الأخير';
    default:
      return 'غير معروف';
  }
}
