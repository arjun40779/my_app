import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/utils/size_config.dart';
import '../../theme/app_theme.dart';

class ProfileVerifiedBadge extends StatefulWidget {
  const ProfileVerifiedBadge({super.key});

  @override
  State<ProfileVerifiedBadge> createState() => _ProfileVerifiedBadgeState();
}

class _ProfileVerifiedBadgeState extends State<ProfileVerifiedBadge> {
  final double paddingVertical = SizeConfig.heightMultiplier;
  final double paddingHorizontal = SizeConfig.widthMultiplier * 3;
  final double borderRadius = SizeConfig.widthMultiplier * 3;
  final double fontSize = SizeConfig.textMultiplier * 4;
  final double sizedBoxWidth = SizeConfig.widthMultiplier * 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
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
