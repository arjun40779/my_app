import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileFooter extends StatefulWidget {
  const ProfileFooter({super.key});

  @override
  State<ProfileFooter> createState() => _ProfileFooterState();
}

class _ProfileFooterState extends State<ProfileFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Logout",
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: Colors.red,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
