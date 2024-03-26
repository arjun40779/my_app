import 'package:flutter/material.dart';
import 'package:my_app/components/my_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: "Notifications",
      ),
      body: Center(
        child: Text("Notification page"),
      ),
    );
  }
}
