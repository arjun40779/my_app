import 'package:flutter/material.dart';

import '../components/my_app_bar.dart';
import '../components/post/post_container.dart';
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
    String filePath = 'assets/post_data.json';
    List<PostData> postDataList = getPostDataFromJsonFile(filePath);
    return Scaffold(
      appBar: MyAppBar(
        leading: true,
        title: 'HOME',
      ),
      body: Padding(
        padding: _postContainerPadding,
        child: ListView.builder(
          itemCount: postDataList.length,
          itemBuilder: (context, index) {
            final data = postDataList[index];
            return PostContainer(
              urgent: data.urgent,
              postDate: data.postDate,
              postTitle: data.postTitle,
              postDescription: data.postDescription,
              postImgLocation: data.postImgLocation,
              userPhone: data.userPhone,
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
