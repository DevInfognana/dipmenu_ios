// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationManager {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('flutter_logo');
//
//     DarwinInitializationSettings initializationIos =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) {},
//     );
//     InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationIos);
//     await notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) {},
//     );
//   }
//
//   Future<void> simpleNotificationShow() async {
//     AndroidNotificationDetails androidNotificationDetails =
//         const AndroidNotificationDetails('Channel_id', 'Channel_title',
//             priority: Priority.high,
//             importance: Importance.max,
//             icon: 'flutter_logo',
//             channelShowBadge: true,
//             largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));
//
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await notificationsPlugin.show(
//         1, 'Order confirmation', 'your order has been confirmed', notificationDetails);
//   }
//
//   Future<void> delayNotificationShow() async {
//     AndroidNotificationDetails androidNotificationDetails =
//     const AndroidNotificationDetails('Channel_id', 'Channel_title',
//         priority: Priority.high,
//         importance: Importance.max,
//         icon: 'flutter_logo',
//         channelShowBadge: true,
//         largeIcon: DrawableResourceAndroidBitmap('flutter_logo'));
//
//     NotificationDetails notificationDetails =
//     NotificationDetails(android: androidNotificationDetails);
//     Future.delayed(
//         const Duration(milliseconds: 6000),
//             ()
//         {
//           notificationsPlugin.show(
//               0, 'Order Status', 'your order has been ready to deliver',
//               notificationDetails);
//         }
//     );
//   }
//
//   Future<void> multipleNotificationShow() async {
//     AndroidNotificationDetails androidNotificationDetails =
//         const AndroidNotificationDetails('Channel_id', 'Channel_title',
//             priority: Priority.high,
//             importance: Importance.max,
//             groupKey: 'commonMessage');
//
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     notificationsPlugin.show(
//         0, 'New Notification', 'User 1 send message', notificationDetails);
//
//     Future.delayed(
//       const Duration(milliseconds: 1000),
//       () {
//         notificationsPlugin.show(
//             1, 'New Notification', 'User 2 send message', notificationDetails);
//       },
//     );
//
//     Future.delayed(
//       const Duration(milliseconds: 1500),
//       () {
//         notificationsPlugin.show(
//             2, 'New Notification', 'User 3 send message', notificationDetails);
//       },
//     );
//
//     List<String> lines = ['user1', 'user2', 'user3'];
//
//     InboxStyleInformation inboxStyleInformation =
//         InboxStyleInformation(lines, contentTitle: '${lines.length} messages',summaryText: 'Code Compilee');
//
//    AndroidNotificationDetails androidNotificationSpesific=AndroidNotificationDetails(
//     'groupChennelId',
//     'groupChennelTitle',
//     styleInformation: inboxStyleInformation,
//     groupKey: 'commonMessage',
//     setAsGroupSummary: true
//    );
//    NotificationDetails platformChannelSpe=NotificationDetails(android: androidNotificationSpesific);
//   await notificationsPlugin.show(3, 'Attention', '${lines.length} messages', platformChannelSpe);
//   }
//
// }


import 'dart:io';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../presentation/routes/routes.dart';
class NotificationService {
  NotificationService();
  final text = Platform.isIOS;
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  final _localNotifications = FlutterLocalNotificationsPlugin();
  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true);

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );




    await _localNotifications.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }
  //
  // @pragma('vm:entry-point')
  // void notificationTapBackground() {
  //
  // }

  Future<NotificationDetails> _notificationDetails() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails(
      'DIP MENU id',
      'DIP Menu name',
      groupKey: 'com.example.dip_menu',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',
      audioAttributesUsage: AudioAttributesUsage.notification,
      // sound: RawResourceAndroidNotificationSound('notification_sound'),
      enableVibration: true,
      color: Color(0xff2196f3),
    );

    IOSNotificationDetails iosNotificationDetails = const IOSNotificationDetails(
        threadIdentifier: "thread1",
        attachments: <IOSNotificationAttachment>[]);

    final details = await _localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      behaviorSubject.add(details.payload!);
    }

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }


  Future<void> showScheduledLocalNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      platformChannelSpecifics,

      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> showdLocalNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: 'welcome'
    );
  }



  void onDidReceiveLocalNotification(
      int id,
      String? title,
      String? body,
      String? payload,
      ) {

  }

  void selectNotification(String? payload) {
    Map notificationValues={"notification": 'show'};
    Get.offAndToNamed(Routes.mainScreen,arguments:notificationValues );
  }

}

