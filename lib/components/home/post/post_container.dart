import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/components/home/post/post_footer.dart';
import 'package:my_app/theme/app_theme.dart';

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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth =
        screenSize.width; // Adjust the multiplier as needed

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors().backgroungColor, // Border color
            width: 15, // Border width
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
                fontSize: 12,
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
                width: screenWidth * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleExclamation,
                          size: 12,
                          color: urgent
                              ? Colors.red
                              : const Color.fromARGB(255, 0, 63, 163),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          urgent ? "Needs urgent help" : "Sick Animal",
                          style: TextStyle(
                            color: urgent
                                ? Colors.red
                                : const Color.fromARGB(255, 0, 63, 163),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      postTitle,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      postDescription,
                      style: TextStyle(color: AppColors().primaryLight),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    postImgLocation,
                    width: screenWidth * 0.3,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: screenWidth * 0.3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        userPhone,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
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
