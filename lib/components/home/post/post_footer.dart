import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/theme/app_theme.dart';

class PostFooter extends StatelessWidget {
  final bool urgent;

  const PostFooter({super.key, this.urgent = false});

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
            child: const Row(
              children: [
                Icon(
                  Icons.call,
                  size: 15,
                ),
                SizedBox(width: 5), // Adjust the spacing between icon and text
                Text(
                  'Call now',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Second group: Icon with rounded border and padding
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                urgent
                    ? FontAwesomeIcons.hourglass
                    : FontAwesomeIcons.solidClock,
                size: 13,
              ),
            ),
          ),

          // Third group: Icon with text
          const Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 15,
              ),
              SizedBox(width: 5), // Adjust the spacing between icon and text
              Text(
                '2 km away',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
