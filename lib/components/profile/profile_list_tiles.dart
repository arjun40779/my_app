import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProfileListTile extends StatefulWidget {
  final String? title;
  final String subTitle;
  final Widget? child;

  const ProfileListTile({
    super.key,
    this.title,
    required this.subTitle,
    this.child,
  });

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  final double paddingVertical = 15;
  final double paddingHorizontal = 20;
  final double titleFontSize = 15;
  final FontWeight titleFontWeight = FontWeight.w400;
  final double subTitleFontSize = 15;
  final FontWeight subTitleFontWeight = FontWeight.bold;
  final double borderWidth = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingVertical),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey, // Border color
            width: borderWidth, // Border width
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: titleFontSize,
                fontWeight: subTitleFontWeight,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.subTitle,
                style: TextStyle(
                  fontSize: subTitleFontSize,
                  fontWeight: subTitleFontWeight,
                ),
              ),
              if (widget.child != null) widget.child!,
            ],
          ),
        ],
      ),
    );
  }
}
