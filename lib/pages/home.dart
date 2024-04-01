import 'package:flutter/material.dart';

import '../components/home/post/post_container.dart';
import '../components/my_app_bar.dart';
import '../pages/capture.dart';
import '../utils/post_data.dart';
import '/theme/app_theme.dart';
import '/utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _btnIconSize = SizeConfig.textMultiplier * 10;
  final EdgeInsets _postContainerPadding =
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3);
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
        padding: _postContainerPadding,
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
          size: _btnIconSize,
        ),
      ),
    );
  }
}
