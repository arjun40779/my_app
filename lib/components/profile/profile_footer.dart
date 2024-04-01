import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/utils/size_config.dart';

class ProfileFooter extends StatefulWidget {
  const ProfileFooter({super.key});

  @override
  State<ProfileFooter> createState() => _ProfileFooterState();
}

class _ProfileFooterState extends State<ProfileFooter> {
  final Color fontColor = Colors.red;
  final double fontSize = SizeConfig.textMultiplier * 5;
  final FontWeight fontWeight = FontWeight.bold;
  final double paddingVertical = SizeConfig.heightMultiplier * 2;
  final double paddingHorizontal = SizeConfig.widthMultiplier * 4;
  void handleOnPress() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Logout",
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          IconButton(
            onPressed: handleOnPress,
            icon: FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: fontColor,
              size: fontSize,
            ),
          )
        ],
      ),
    );
  }
}
