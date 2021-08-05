import 'package:flutter/material.dart';
import 'package:flutter_simple_notification/utils/received_notification.dart';
import 'package:flutter_simple_notification/widgets/custom_button.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final ReceivedNotification arg =
        ModalRoute.of(context)?.settings.arguments as ReceivedNotification;
    return Scaffold(
      appBar: AppBar(
        title: Text('Title: ${arg.payload}'),
      ),
      body: Center(
        child: CustomButton(
          text: 'Go Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
