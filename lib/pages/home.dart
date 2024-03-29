import 'package:flutter/material.dart';
import 'package:my_app/utils/size_config.dart';
import '/theme/app_theme.dart';
import '../components/home/post/post_container.dart';
import '../components/my_app_bar.dart';
import '../pages/capture.dart';
import '../utils/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Corrected the key parameter

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToCapturePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CapturePage()));
  }

  final double btnIconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        leading: true,
        title: "HOME",
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
          child: ListView.builder(
            itemCount: postData.length,
            itemBuilder: (context, index) {
              // Corrected the parameters passed to PostContainer
              return PostContainer(
                urgent: postData[index]["urgent"] as bool,
                postDate: postData[index]["postDate"] as String,
                postTitle: postData[index]["postTitle"] as String,
                postDescription: postData[index]["postDescription"] as String,
                postImgLocation: postData[index]["postImgLocation"] as String,
                userPhone: postData[index]["userPhone"] as String,
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToCapturePage,
        shape: const CircleBorder(),
        backgroundColor: AppColors.secondary,
        child: Icon(
          Icons.add,
          size: btnIconSize,
        ), // Change the color as needed
      ),
    );
  }
}
