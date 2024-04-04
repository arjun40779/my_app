// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/theme/app_theme.dart';
import '/utils/size_config.dart';
import 'post_footer.dart';

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

  final EdgeInsets _containerPadding = EdgeInsets.symmetric(
    vertical: SizeConfig.heightMultiplier * 2,
    horizontal: SizeConfig.widthMultiplier * 6,
  );
  final EdgeInsets _paddingLeftContainer =
      EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1);
  final TextStyle _headingStyle = AppTextStyle.heading();
  final TextStyle _subHeadingStyle = AppTextStyle.subHeading();
  final double _postContentWidth = SizeConfig.widthMultiplier * 50;
  final double _postImgWidth = SizeConfig.widthMultiplier * 30;
  final double _userPhoneWidth = SizeConfig.widthMultiplier * 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _containerPadding,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.backgroungColor,
            width: SizeConfig.widthMultiplier * 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: _paddingLeftContainer),
          _postDate(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: _postContentWidth, child: _postContent()),
              _postImageAndPhone(),
            ],
          ),
          PostFooter(urgent: urgent),
        ],
      ),
    );
  }

  Widget _postDate() {
    return Text(postDate,
        style: AppTextStyle.normal(
            color: urgent ? Colors.red : Colors.black,
            fontWeight: FontWeight.bold));
  }

  Widget _postContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: _rowChildren(),
        ),
        SizedBox(height: SizeConfig.heightMultiplier),
        Text(
          postTitle,
          style: _headingStyle,
        ),
        SizedBox(height: SizeConfig.heightMultiplier),
        Text(postDescription, style: _subHeadingStyle),
      ],
    );
  }

  Widget _postImageAndPhone() {
    final EdgeInsets paddingPhone =
        EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.4);
    final BorderRadius radiusPhone =
        BorderRadius.circular(SizeConfig.widthMultiplier * 2.5);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          postImgLocation,
          width: _postImgWidth,
          fit: BoxFit.contain,
        ),
        SizedBox(height: SizeConfig.heightMultiplier),
        Container(
          width: _userPhoneWidth,
          padding: paddingPhone,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: radiusPhone,
          ),
          child: Center(
            child: Text(
              userPhone,
              style: AppTextStyle.subHeading(
                  color: Colors.white, letterSpacing: 0.9),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _rowChildren() {
    return [
      FaIcon(FontAwesomeIcons.circleExclamation,
          size: SizeConfig.textMultiplier * 4,
          color: urgent ? Colors.red : AppColors.blue),
      SizedBox(width: SizeConfig.widthMultiplier * 2),
      Text(
        urgent ? "Needs urgent help" : "Sick Animal",
        style: TextStyle(
          color: urgent ? Colors.red : AppColors.blue,
          fontSize: SizeConfig.textMultiplier * 4,
        ),
      ),
    ];
  }
}
