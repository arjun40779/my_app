import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/my_app_bar.dart';
import '/utils/size_config.dart';

class CapturePage extends StatelessWidget {
  CapturePage({super.key});

  final String alertBoxText = "Allow Planet for all to access your camera";
  final double alertBoxFontSize = SizeConfig.textMultiplier * 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Capture"),
      backgroundColor: Colors.grey,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          buildAlertDialog(context),
          buildBlackContainer(),
          buildMainFloatingActionButton(),
          buildRotateFloatingActionButton(),
        ],
      ),
    );
  }

  Widget buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        alertBoxText,
        style: TextStyle(
          fontSize: alertBoxFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildAlertDialogButton(context, "Allow Once"),
          buildAlertDialogButton(context, "Deny"),
        ],
      ),
    );
  }

  Widget buildAlertDialogButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        // Add onPressed action for "Allow Once" or "Deny"
        Navigator.of(context).pop(); // Close the dialog
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget buildBlackContainer() {
    return Container(
      height: 210,
      color: Colors.black,
    );
  }

  Widget buildMainFloatingActionButton() {
    return Positioned(
      bottom: 100, // Adjust the bottom position as needed
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 7),
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed action here
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget buildRotateFloatingActionButton() {
    return Positioned(
      right: 50,
      bottom: 110, // Adjust the bottom position as needed
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        child: const FaIcon(
          FontAwesomeIcons.arrowsRotate,
          color: Colors.white,
        ),
      ),
    );
  }
}
