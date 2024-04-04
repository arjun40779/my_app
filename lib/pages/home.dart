import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  late Future<List<PostData>> postDataList;
  Future<List<PostData>> getData() async {
    final String response =
        await rootBundle.loadString('assets/post_data.json');
    final List<dynamic> decodedData = json.decode(response);
    final List<PostData> postDataList =
        decodedData.map((item) => PostData.fromJson(item)).toList();
    return postDataList;
  }

  @override
  void initState() {
    super.initState();
    postDataList = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'HOME',
      ),
      body: Padding(padding: _postContainerPadding, child: _listBuilder()),
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

  Widget _listBuilder() {
    return FutureBuilder<List<PostData>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<PostData> postDataList = snapshot.data!;
          return ListView.builder(
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
          );
        }
      },
    );
  }
}
