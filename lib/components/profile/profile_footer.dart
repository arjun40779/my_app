import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/app_theme.dart';
import '/utils/size_config.dart';

class ProfileFooter extends StatefulWidget {
  const ProfileFooter({super.key});

  @override
  State<ProfileFooter> createState() => _ProfileFooterState();
}

class _ProfileFooterState extends State<ProfileFooter> {
  final Color fontColor = Colors.red;
  final double fontSize = SizeConfig.textMultiplier * 4;
  final FontWeight fontWeight = FontWeight.bold;
  final EdgeInsets paddingFooter = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier * 2,
      horizontal: SizeConfig.widthMultiplier * 4);
  void handleOnPress() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingFooter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Logout", style: AppTextStyle.heading(color: Colors.red)),
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
