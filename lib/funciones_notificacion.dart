import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> showNotification() async {
  AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    'canal_de_mensaje',
    'Notificaciones de mensajes',
    importance: Importance.max,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
    1,
    'Warded',
    'Se activó un marcador en esta ubicación.',
    notificationDetails,
  );
}

Future<void> showNotificationAlarm() async {
  AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    'canal_de_mensaje',
    'Notificaciones de mensajes',
    importance: Importance.max,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
    2,
    'Warded',
    'Se activó la alarma en esta ubicación.',
    notificationDetails,
  );
}

Future<void> showNotificationAlarmHealth() async {
  AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
    'canal_de_mensaje',
    'Notificaciones de mensajes',
    importance: Importance.max,
    priority: Priority.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
    3,
    'Warded',
    'Se activó la alarma salud en esta ubicación.',
    notificationDetails,
  );
}

void selectNotification(NotificationResponse response) async {
  String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=Celebra+Zonamerica+Uruguay";
  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'No se pudo abrir Google Maps';
  }
}