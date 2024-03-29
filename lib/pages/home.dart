import 'package:flutter/material.dart';
import 'package:my_app/utils/size_config.dart';
import '/theme/app_theme.dart';
import '../components/home/post/post_container.dart';
import '../components/my_app_bar.dart';
import '../pages/capture.dart';
import '../utils/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double btnIconSize = 35;

  void _navigateToCapturePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CapturePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        leading: true,
        title: 'HOME',
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
        child: ListView.builder(
          itemCount: postData.length,
          itemBuilder: (context, index) {
            final data = postData[index];
            return PostContainer(
              urgent: data['urgent'] as bool,
              postDate: data['postDate'] as String,
              postTitle: data['postTitle'] as String,
              postDescription: data['postDescription'] as String,
              postImgLocation: data['postImgLocation'] as String,
              userPhone: data['userPhone'] as String,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCapturePage,
        shape: const CircleBorder(),
        backgroundColor: AppColors.secondary,
        child: Icon(
          Icons.add,
          size: btnIconSize,
        ),
      ),
    );
  }
}
