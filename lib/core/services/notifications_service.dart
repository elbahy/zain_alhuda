import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  final bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  //initialize the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  Future<void> initNotification() async {
    if (_isInitialized) return;

    // prepare android and ios notification settings
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init settings
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // finaly initialize the plugin
    await notificationsPlugin.initialize(initializationSettings);
  }

// notification details setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily notification channel id',
          'daily notification channel name',
          channelDescription: 'daily notification channel description',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }

  // show notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }
}
