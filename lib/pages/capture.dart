import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/my_app_bar.dart';
import '../theme/app_theme.dart';
import '/utils/size_config.dart';

class CapturePage extends StatelessWidget {
  CapturePage({super.key});

  final String alertBoxText = "Allow Planet for all to access your camera";
  final double alertBoxFontSize = SizeConfig.textMultiplier * 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Capture"),
      backgroundColor: AppColors.grey,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _alertDialog(context),
          _blackContainer(),
          _mainFloatingActionButton(),
          _rotateFloatingActionButton(),
        ],
      ),
    );
  }

  Widget _alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(alertBoxText, style: AppTextStyle.heading()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _alertDialogButton(context, "Allow Once"),
          _alertDialogButton(context, "Deny"),
        ],
      ),
    );
  }

  Widget _alertDialogButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        text,
        style: const TextStyle(color: AppColors.secondary),
      ),
    );
  }

  Widget _blackContainer() {
    return Container(
      height: 25 * SizeConfig.heightMultiplier,
      color: AppColors.primary,
    );
  }

  Widget _mainFloatingActionButton() {
    final borderButton = Border.all(
        color: AppColors.grey, width: SizeConfig.widthMultiplier * 2);
    return Positioned(
      bottom: 10 *
          SizeConfig.heightMultiplier, // Adjust the bottom position as needed
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: borderButton,
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

  Widget _rotateFloatingActionButton() {
    return Positioned(
      right: 17 * SizeConfig.widthMultiplier,
      bottom: 10 *
          SizeConfig.heightMultiplier, // Adjust the bottom position as needed
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        child: const FaIcon(
          FontAwesomeIcons.arrowsRotate,
          color: Colors.white,
        ),
      ),
    );
  }
}
