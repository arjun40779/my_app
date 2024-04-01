import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("SafeBlockHorizontal: ${SizeConfig.safeBlockHorizontal}");
    print("SafeBlockVertical: ${SizeConfig.safeBlockVertical}");
    print(SizeConfig.heightMultiplier);
    return Scaffold(
        body: Center(
            child: CustomButton(
                variant: ButtonVariant.outline,
                size: ButtonSize.small,
                leftIcon: Icons.arrow_back,
                rightIcon: Icons.arrow_forward,
                disabled: true,
                text: "Button",
                onPressed: () {
                  print("hello");
                })));
  }
}
