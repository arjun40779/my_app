import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int currPageIndex;
  final void Function(int) changePageIndex;

  const NavBar({
    super.key,
    required this.currPageIndex,
    required this.changePageIndex,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        widget.changePageIndex(index);
      },
      indicatorColor: Colors.amber,
      selectedIndex: widget.currPageIndex,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(
            icon: Icon(Icons.notifications), label: "Notification"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        NavigationDestination(icon: Icon(Icons.message), label: "Messages"),
        NavigationDestination(icon: Icon(Icons.bookmark), label: "Bookmarks"),
      ],
    );
  }
}
