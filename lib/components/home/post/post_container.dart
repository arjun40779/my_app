import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/utils/size_config.dart';
import '/components/home/post/post_footer.dart';
import '/theme/app_theme.dart';

class PostContainer extends StatelessWidget {
  final bool urgent;
  final String postDate;
  final String postTitle;
  final String postDescription;
  final String userPhone;
  final String postImgLocation;
  PostContainer({
    super.key,
    required this.urgent,
    required this.postDate,
    required this.postTitle,
    required this.postDescription,
    required this.userPhone,
    required this.postImgLocation,
  });

  final double paddingVertical = 10;
  final double paddingHorizontal = 20;
  final double postDateFontSize = SizeConfig.textMultiplier * 3;
  final double postTitleFontSize = SizeConfig.textMultiplier * 5;
  final double postDescriptionFontSize = SizeConfig.textMultiplier * 4;
  final double userPhoneFontSize = SizeConfig.textMultiplier * 3;
  final double phoneContainerRadius = SizeConfig.widthMultiplier * 4;
  final double postImgWidth = SizeConfig.widthMultiplier * 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.backgroungColor, // Border color
            width: SizeConfig.widthMultiplier * 3, // Border width
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              postDate,
              style: TextStyle(
                fontSize: postDateFontSize,
                fontWeight: FontWeight.w700,
                color: urgent ? Colors.red : Colors.black,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.widthMultiplier * 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: rowChildren(urgent),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1),
                    Text(
                      postTitle,
                      style: TextStyle(
                          fontSize: postTitleFontSize,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      postDescription,
                      style: TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: postDescriptionFontSize),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    postImgLocation,
                    width: postImgWidth,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 3),
                  Container(
                    width: SizeConfig.widthMultiplier * 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(phoneContainerRadius),
                    ),
                    child: Center(
                      child: Text(
                        userPhone,
                        style: TextStyle(
                            fontSize: userPhoneFontSize, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          PostFooter(urgent: urgent),
        ],
      ),
    );
  }
}

List<Widget> rowChildren(bool urgent) {
  return [
    FaIcon(
      FontAwesomeIcons.circleExclamation,
      size: SizeConfig.textMultiplier * 4,
      color: urgent ? Colors.red : const Color.fromARGB(255, 0, 63, 163),
    ),
    const SizedBox(width: 10),
    Text(
      urgent ? "Needs urgent help" : "Sick Animal",
      style: TextStyle(
        color: urgent ? Colors.red : const Color.fromARGB(255, 0, 63, 163),
        fontSize: SizeConfig.textMultiplier * 4,
      ),
    ),
  ];
}
