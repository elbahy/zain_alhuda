import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void onTap(NotificationResponse details) {}

class LocalNotificationsService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> flutterLocalNotificationsInilizer() async {
    const InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  Future<void> showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('id 1', 'basic notification'));
    await flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails);
  }

  Future<void> showRepeatingNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval repeateInterval,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 1',
      'repeating notification',
      priority: Priority.high,
      importance: Importance.max,
    ));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, repeateInterval, notificationDetails);
  }
}
