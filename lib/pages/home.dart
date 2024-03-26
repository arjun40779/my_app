import 'package:flutter/material.dart';
import 'package:my_app/components/home/post/post_container.dart';
import 'package:my_app/components/my_app_bar.dart';
import 'package:my_app/pages/capture.dart';
import 'package:my_app/utils/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Corrected the key parameter

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        leanding: true,
        title: "HOME",
      ),
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CapturePage()));
          // Add your onPressed action here
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          size: 35,
        ), // Change the color as needed
      ),
    );
  }
}
