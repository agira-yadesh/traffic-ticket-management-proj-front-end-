import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({
    super.key,
  });

  var numOfNotifications = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 239, 240),
        title: Text('Notifications($numOfNotifications)'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Clear All',
                style: TextStyle(
                    color: Color.fromARGB(199, 255, 84, 84),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 238, 239, 240),
    );
  }
}
