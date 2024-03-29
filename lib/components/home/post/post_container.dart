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

  const PostContainer({
    super.key,
    required this.urgent,
    required this.postDate,
    required this.postTitle,
    required this.postDescription,
    required this.userPhone,
    required this.postImgLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
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
          _buildPostDate(),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildPostContent(),
              ),
              _buildPostImageAndPhone(),
            ],
          ),
          PostFooter(urgent: urgent),
        ],
      ),
    );
  }

  Widget _buildPostDate() {
    return Text(
      postDate,
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier * 3,
        fontWeight: FontWeight.w700,
        color: urgent ? Colors.red : Colors.black,
      ),
    );
  }

  Widget _buildPostContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: rowChildren(),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 1),
        Text(
          postTitle,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          postDescription,
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: SizeConfig.textMultiplier * 4,
          ),
        ),
      ],
    );
  }

  Widget _buildPostImageAndPhone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          postImgLocation,
          width: SizeConfig.widthMultiplier * 30,
          fit: BoxFit.contain,
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 3),
        _buildPhoneContainer(),
      ],
    );
  }

  Widget _buildPhoneContainer() {
    return Container(
      width: SizeConfig.widthMultiplier * 30,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 4),
      ),
      child: Center(
        child: Text(
          userPhone,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Widget> rowChildren() {
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
}
