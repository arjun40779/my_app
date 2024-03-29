import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/utils/size_config.dart';
import '../components/my_app_bar.dart';

class CapturePage extends StatelessWidget {
  CapturePage({super.key});
  final String alertBoxText = "Allow Planet for all to access your camera";
  final double alertBoxfontSize = SizeConfig.textMultiplier * 4;
  final FontWeight alertBoxFontWeight = FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Capture"),
      backgroundColor: Colors.grey,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AlertDialog(
              title: Text(
                alertBoxText,
                style: TextStyle(
                    fontSize: alertBoxfontSize, fontWeight: alertBoxFontWeight),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add onPressed action for "Allow Once"
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text(
                      "Allow Once",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Add onPressed action for "Deny"
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text("Deny",
                          style: TextStyle(color: Colors.blue))),
                ],
              ),
            ),
            Container(
              height: 210,
              color: Colors.black,
            ),
            Positioned(
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
            ),
            Positioned(
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
            ),
          ],
        ),
      ),
    );
  }
}
