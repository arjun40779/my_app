import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/app_theme.dart';

class ProfileVerifiedBadge extends StatefulWidget {
  const ProfileVerifiedBadge({super.key});

  @override
  State<ProfileVerifiedBadge> createState() => _ProfileVerifiedBadgeState();
}

class _ProfileVerifiedBadgeState extends State<ProfileVerifiedBadge> {
  final double paddingVertical = 5;
  final double paddingHorizontal = 10;
  final double borderRadius = 15;
  final double fontSize = 12;
  final double sizedBoxWidth = 5;
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
