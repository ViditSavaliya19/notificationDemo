import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void initServices(BuildContext context)
async{

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    var token = await firebaseMessaging.getToken();
    print("Token $token");

    NotificationSettings notificationSettings= await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((message) {

      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );

      if (notification != null) {


        print("${notification.title}  ");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${notification.body}")));
      }


    });
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}