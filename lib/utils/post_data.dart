import 'dart:convert';
import 'dart:io';

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

List<PostData> getPostDataFromJsonFile(String filePath) {
  try {
    File file = File(filePath);
    String contents = file.readAsStringSync();
    List<dynamic> jsonData = json.decode(contents);
    List<PostData> postDataList =
        jsonData.map((json) => PostData.fromJson(json)).toList();
    return postDataList;
  } catch (e) {
    return [];
  }
}
