import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/size_config.dart';
import '/components/my_app_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String text = "hello world";
  String text2 = "hello world";
  double height = SizeConfig.heightMultiplier * 20;
  double width = SizeConfig.widthMultiplier * 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Notifications",
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          Ink(
            color: AppColors.secondary,
            child: InkWell(
              onTap: () {
                setState(() {
                  text = "inkwell tapped";
                });
              },
              onDoubleTap: () {
                setState(() {
                  text = "inkwell tapped twice";
                });
              },
              onLongPress: () {
                setState(() {
                  text = "inkwell long pressed";
                });
              },
              highlightColor: AppColors.backgroungColor,
              splashColor: AppColors.red,
              enableFeedback: false,
              child: SizedBox(
                height: height,
                width: width,
                child: const Center(child: Text('Inkwell')),
              ),
            ),
          ),
          Text(text2),
          GestureDetector(
            onPanStart: (value) {
              setState(() {
                text2 = "dragging";
              });
            },
            onPanEnd: (value) {
              setState(() {
                text2 = " dragg end";
              });
            },
            child: Container(
              color: AppColors.grey,
              height: height,
              width: width,
              child: const Center(child: Text("Gesture")),
            ),
          )
        ],
      )),
    );
  }
}
