// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/my_app_bar.dart';
import 'package:my_app/components/profile/profile_footer.dart';
import 'package:my_app/components/profile/profile_list_tiles.dart';
import 'package:my_app/components/profile/profile_varified_badge.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            childWidget: ProfileVerifiedBadge(),
          ),
          ProfileListTile(
            title: "Phone Number",
            subTitle: "+919876543210",
            childWidget: TextButton(
              onPressed: () {},
              child: Text(
                "Verify",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ProfileListTile(
            title: "Pin Code",
            subTitle: "123456",
            childWidget: TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ProfileListTile(
              title: "Emergency helpline",
              subTitle: "123456789",
              childWidget: IconButton(
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
