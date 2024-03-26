import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/pages/notification_page.dart';
import 'package:my_app/pages/profile.dart';

/// A custom app bar widget.
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Indicates whether to show the leading icon.
  final bool leanding;

  /// The title of the app bar.
  final String title;

  /// Constructs a [MyAppBar].
  const MyAppBar({super.key, this.leanding = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: leanding
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.solidUser,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: !Navigator.of(context).canPop()
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()),
                      );
                    }
                  : null,
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
