import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/app_theme.dart';
import '/utils/size_config.dart';

class ProfileVerifiedBadge extends StatefulWidget {
  const ProfileVerifiedBadge({super.key});

  @override
  State<ProfileVerifiedBadge> createState() => _ProfileVerifiedBadgeState();
}

class _ProfileVerifiedBadgeState extends State<ProfileVerifiedBadge> {
  final double borderRadius = SizeConfig.widthMultiplier * 3;
  final double fontSize = SizeConfig.textMultiplier * 4;
  final double sizedBoxWidth = SizeConfig.widthMultiplier * 2;

  final EdgeInsets paddingBadge = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier * 0.7,
      horizontal: SizeConfig.widthMultiplier * 3);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingBadge,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius:
            BorderRadius.circular(borderRadius), // Adding border radius
      ),
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.circleCheck,
            color: Colors.white,
            size: fontSize,
          ),
          SizedBox(
            width: sizedBoxWidth,
          ),
          Text(
            "Verified",
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          )
        ],
      ),
    );
  }
}
