import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class PostData {
  final bool urgent;
  final String postTitle;
  final String postDescription;
  final String postDate;
  final String userPhone;
  final String postImgLocation;

  PostData({
    required this.urgent,
    required this.postTitle,
    required this.postDescription,
    required this.postDate,
    required this.userPhone,
    required this.postImgLocation,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      urgent: json['urgent'],
      postTitle: json['postTitle'],
      postDescription: json['postDescription'],
      postDate: json['postDate'],
      userPhone: json['userPhone'],
      postImgLocation: json['postImgLocation'],
    );
  }
}

Future<List<PostData>> getPostDataFromJsonFile(String filePath) async {
  try {
    final String response = await rootBundle.loadString(filePath);
    final data = await json.decode(response);

    return data;
  } catch (e) {
    return [];
  }
}
