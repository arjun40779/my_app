import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/theme/app_theme.dart';
import '/utils/size_config.dart';

class PostFooter extends StatelessWidget {
  final bool urgent;

  PostFooter({super.key, this.urgent = false});
  final double fontSize = SizeConfig.textMultiplier * 4;
  final double iconSize = SizeConfig.textMultiplier * 4;
  final double sizedBoxWidth = SizeConfig.widthMultiplier * 2;
  final double hourglasIconPaddingVertical = SizeConfig.heightMultiplier * 1;
  final double hourglasIconPaddingHorizontal = SizeConfig.widthMultiplier * 2;
  final double containerPaddingVertical = SizeConfig.heightMultiplier * 1;
  final double containerPaddinghorizontal = SizeConfig.widthMultiplier * 5;
  final double containerMarginVertical = SizeConfig.heightMultiplier * 1.5;
  final double containerRadius = SizeConfig.widthMultiplier * 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: containerPaddingVertical,
          horizontal: containerPaddinghorizontal),
      margin: EdgeInsets.symmetric(vertical: containerMarginVertical),
      decoration: BoxDecoration(
        color: AppColors.backgroungColor,
        borderRadius: BorderRadius.all(Radius.circular(containerRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First group: Icon followed by text
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.call,
                  size: iconSize,
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ), // Adjust the spacing between icon and text
                Text(
                  'Call now',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Second group: Icon with rounded border and padding
          Container(
            padding: EdgeInsets.symmetric(
              vertical: hourglasIconPaddingVertical,
              horizontal: hourglasIconPaddingHorizontal,
            ),
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                urgent
                    ? FontAwesomeIcons.hourglass
                    : FontAwesomeIcons.solidClock,
                size: iconSize,
              ),
            ),
          ),
          // Third group: Icon with text
          Row(
            children: [
              Icon(
                Icons.location_pin,
                size: iconSize,
              ),
              SizedBox(
                  width:
                      sizedBoxWidth), // Adjust the spacing between icon and text
              Text(
                '2 km away',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
