import 'package:flutter/material.dart';
import 'components/navigation_bar.dart';
import 'pages/bookmarks.dart';
import 'pages/home.dart';
import 'pages/messages.dart';
import 'pages/notification_page.dart';
import 'pages/profile.dart';
import 'components/custom_button.dart';
import 'theme/app_theme.dart';
import '/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black))),
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        fontFamily: 'poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currPageIndex = 0;
  void changePageIndex(int ind) {
    setState(() {
      currPageIndex = ind;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        bottomNavigationBar: NavBar(
            currPageIndex: currPageIndex, changePageIndex: changePageIndex),
        body: const <Widget>[
          HomePage(),
          NotificationPage(),
          ProfilePage(),
          Messages(),
          Bookmarks()
        ][currPageIndex]);
  }
}
