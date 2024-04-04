import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '/theme/app_theme.dart';
import 'pages/gallery.dart';
import 'pages/home.dart';
import 'pages/list_page.dart';
import 'pages/messages.dart';
import 'pages/notification_page.dart';
import 'pages/profile.dart';
import 'utils/size_config.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/mainlayout': (context) => const MainLayout(),
        '/profile': (context) => const ProfilePage(),
        '/messages': (context) => const Messages(),
        '/notification': (context) => const NotificationPage(),
      },
      initialRoute: '/mainlayout',
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final _homePageKey = GlobalKey<NavigatorState>();
  final _profilePageKey = GlobalKey<NavigatorState>();
  final _messagesKey = GlobalKey<NavigatorState>();
  final _notificationKey = GlobalKey<NavigatorState>();
  final _galleryKey = GlobalKey<NavigatorState>();
  final _listPageKey = GlobalKey<NavigatorState>();

  NavigatorState? _getCurrentNavigator() {
    switch (_currentIndex) {
      case 0:
        return _homePageKey.currentState;
      case 1:
        return _profilePageKey.currentState;
      case 2:
        return _messagesKey.currentState;
      case 3:
        return _notificationKey.currentState;
      case 4:
        _galleryKey.currentContext;
      case 5:
        _listPageKey.currentContext;
      default:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            key: _homePageKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const HomePage(),
            ),
          ),
          Navigator(
            key: _profilePageKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ProfilePage(),
            ),
          ),
          Navigator(
            key: _messagesKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const Messages(),
            ),
          ),
          Navigator(
            key: _notificationKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const NotificationPage(),
            ),
          ),
          Navigator(
            key: _galleryKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const GalleryPage(),
            ),
          ),
          Navigator(
            key: _listPageKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ListPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex == index && _getCurrentNavigator()!.canPop()) {
            _getCurrentNavigator()!.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.photoFilm,
              ),
              label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "list")
        ],
      ),
    );
  }
}
