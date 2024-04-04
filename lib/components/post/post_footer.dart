import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/theme/app_theme.dart';
import '/utils/size_config.dart';

class PostFooter extends StatelessWidget {
  final bool urgent;

  PostFooter({super.key, this.urgent = false});
  final EdgeInsets paddingHourglassContainer = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier,
      horizontal: 2 * SizeConfig.widthMultiplier);
  final EdgeInsets paddingContainer = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier * 1,
      horizontal: SizeConfig.widthMultiplier * 5);
  final EdgeInsets marginContainer =
      EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.5);

  final double containerRadius = SizeConfig.widthMultiplier * 5;
  final double fontSize = SizeConfig.textMultiplier * 4;
  final double iconSize = SizeConfig.textMultiplier * 4;
  final double sizedBoxWidth = SizeConfig.widthMultiplier * 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingContainer,
      margin: marginContainer,
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
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: sizedBoxWidth,
                ), // Adjust the spacing between icon and text
                Text('Call now', style: AppTextStyle.heading())
              ],
            ),
          ),
          // Second group: Icon with rounded border and padding
          Container(
            padding: paddingHourglassContainer,
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
                style: AppTextStyle.heading(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
