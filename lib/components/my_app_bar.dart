import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/notification_page.dart';
import '../pages/profile.dart';
import '../theme/app_theme.dart';
import '/utils/size_config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool leading;
  final String title;
  MyAppBar({super.key, this.leading = false, required this.title});
  final double fontSize = SizeConfig.textMultiplier * 5;
  final double iconSize = SizeConfig.textMultiplier * 6;
  void navigeteToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  void navigeteToNotificationPage(BuildContext context) {
    !Navigator.of(context).canPop()
        ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationPage()),
            );
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: leading
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.solidUser,
                    size: iconSize,
                    color: Colors.white,
                  ),
                )
              : null,
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
