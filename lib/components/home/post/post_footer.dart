import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/theme/app_theme.dart';
import '/utils/size_config.dart';

class PostFooter extends StatelessWidget {
  final bool urgent;

  PostFooter({super.key, this.urgent = false});
  final double fontSize = SizeConfig.textMultiplier * 4;
  final double iconSize = SizeConfig.textMultiplier * 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.backgroungColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
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
                SizedBox(width: 5), // Adjust the spacing between icon and text
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
                vertical: SizeConfig.heightMultiplier * 3,
                horizontal: SizeConfig.widthMultiplier * 2),
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
              SizedBox(width: 5), // Adjust the spacing between icon and text
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
