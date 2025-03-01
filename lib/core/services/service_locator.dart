import 'package:get_it/get_it.dart';
import 'package:zain_alhuda/core/databases/cache/cache_helper.dart';
import 'package:zain_alhuda/core/services/local_notifications_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<LocalNotificationsService>(
      LocalNotificationsService());
}
