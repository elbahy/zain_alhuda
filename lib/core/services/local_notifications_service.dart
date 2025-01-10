import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

void onTap(NotificationResponse notificationResponse) {
  if (notificationResponse.payload != null) {}
}

class LocalNotificationsService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> flutterLocalNotificationsInilizer() async {
    const InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    await flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: onTap,
        onDidReceiveNotificationResponse: onTap);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  Future<void> showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 2',
        'basic notification',
        priority: Priority.high,
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('azan.wav'.split('.').first),
        icon: '@mipmap/ic_launcher',
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> showRepeatingNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval repeateInterval,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 3',
      'repeating notification',
      priority: Priority.high,
      importance: Importance.max,
    ));
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, repeateInterval, notificationDetails);
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required TZDateTime scheduledDate,
    required String playLoad,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 9',
      'scheduled notification',
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('azan'),
      fullScreenIntent: true,
    ));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: playLoad,
    );
  }
}
