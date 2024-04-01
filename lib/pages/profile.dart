// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/my_app_bar.dart';
import '../components/profile/profile_footer.dart';
import '../components/profile/profile_list_tiles.dart';
import '../components/profile/profile_varified_badge.dart';
import '/utils/size_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double fontSize = SizeConfig.textMultiplier * 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Profile",
      ),
      body: ListView(
        children: [
          const ProfileListTile(
            title: "Name",
            subTitle: "Arjun",
          ),
          ProfileListTile(
            title: "Email",
            subTitle: "arjun@gmail.com",
            child: ProfileVerifiedBadge(),
          ),
          ProfileListTile(
            title: "Phone Number",
            subTitle: "+919876543210",
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Verify",
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ProfileListTile(
            title: "Pin Code",
            subTitle: "123456",
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ProfileListTile(
              title: "Emergency helpline",
              subTitle: "123456789",
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.phone,
                    size: 15,
                  ))),
          ProfileListTile(
            subTitle: "Terms & condition",
          ),
          ProfileFooter(),
        ],
      ),
    );
  }
}
