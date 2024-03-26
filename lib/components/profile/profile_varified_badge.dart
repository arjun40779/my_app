import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileVerifiedBadge extends StatefulWidget {
  const ProfileVerifiedBadge({super.key});

  @override
  State<ProfileVerifiedBadge> createState() => _ProfileVerifiedBadgeState();
}

class _ProfileVerifiedBadgeState extends State<ProfileVerifiedBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 72, 149, 74),
        borderRadius: BorderRadius.circular(15), // Adding border radius
      ),
      child: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.circleCheck,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Verified",
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}
