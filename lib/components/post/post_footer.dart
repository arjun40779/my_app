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
    return _root();
  }

  Widget _root() {
    return Container(
      padding: paddingContainer,
      margin: marginContainer,
      decoration: BoxDecoration(
        color: AppColors.backgroungColor,
        borderRadius: BorderRadius.all(Radius.circular(containerRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_callNow(), _hourGlass(), _location()],
      ),
    );
  }

  Widget _callNow() {
    return TextButton(
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
          ),
          Text('Call now', style: AppTextStyle.heading())
        ],
      ),
    );
  }

  Widget _hourGlass() {
    return Container(
      padding: paddingHourglassContainer,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(
          urgent ? FontAwesomeIcons.hourglass : FontAwesomeIcons.solidClock,
          size: iconSize,
        ),
      ),
    );
  }

  Widget _location() {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          size: iconSize,
        ),
        SizedBox(
            width: sizedBoxWidth), // Adjust the spacing between icon and text
        Text(
          '2 km away',
          style: AppTextStyle.heading(),
        ),
      ],
    );
  }
}
