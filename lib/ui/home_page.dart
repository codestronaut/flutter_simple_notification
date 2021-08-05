import 'package:flutter/material.dart';
import 'package:flutter_simple_notification/main.dart';
import 'package:flutter_simple_notification/ui/detail_page.dart';
import 'package:flutter_simple_notification/utils/notification_helper.dart';
import 'package:flutter_simple_notification/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
      context,
      DetailPage.routeName,
    );
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
      context,
      DetailPage.routeName,
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Notification'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                text: 'Show Notification',
                onPressed: () async {
                  await _notificationHelper.showNotification(
                    flutterLocalNotificationsPlugin,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
